//
//  GridLayout.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

internal protocol GirdLayoutDelegate: class {
    
    // MARK: - Required
    func collectionViewColumn(for section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, layout: GirdLayout, sizeForItemAt indexPath: IndexPath) -> Grid.Size
}

internal class GirdLayout: UICollectionViewLayout {
    
    public static let automaticSize: CGSize = UICollectionViewFlowLayout.automaticSize
    
    public struct Const {
        static let minimumLineSpacing: CGFloat = 0.0
        static let minimumInteritemSpacing: CGFloat = 0.0
        static let sectionInset: UIEdgeInsets = .zero
        static let headerHeight: CGFloat = 0.0
        static let headerInset: UIEdgeInsets = .zero
        static let footerHeight: CGFloat = 0.0
        static let footerInset: UIEdgeInsets = .zero
        static let estimatedItemSize: CGSize = CGSize(width: 300.0, height: 300.0)
    }
    
    public var minimumLineSpacing: CGFloat = Const.minimumLineSpacing {
        didSet { invalidateLayoutIfChanged(oldValue, minimumLineSpacing) }
    }
    
    public var minimumInteritemSpacing: CGFloat = Const.minimumInteritemSpacing {
        didSet { invalidateLayoutIfChanged(oldValue, minimumInteritemSpacing) }
    }
    
    public var sectionInset: UIEdgeInsets = Const.sectionInset {
        didSet { invalidateLayoutIfChanged(oldValue, sectionInset) }
    }
    
    public var headerHeight: CGFloat = Const.headerHeight {
        didSet { invalidateLayoutIfChanged(oldValue, headerHeight) }
    }
    
    public var headerInset: UIEdgeInsets = Const.headerInset {
        didSet { invalidateLayoutIfChanged(oldValue, headerInset) }
    }
    
    public var footerHeight: CGFloat = Const.footerHeight {
        didSet { invalidateLayoutIfChanged(oldValue, footerHeight) }
    }
    
    public var footerInset: UIEdgeInsets = Const.footerInset {
        didSet { invalidateLayoutIfChanged(oldValue, footerInset) }
    }
    
    public var estimatedItemSize: CGSize = Const.estimatedItemSize {
        didSet { invalidateLayoutIfChanged(oldValue, estimatedItemSize) }
    }
    
    private lazy var headersAttribute = [Int: UICollectionViewLayoutAttributes]()
    private lazy var footersAttribute = [Int: UICollectionViewLayoutAttributes]()
    private lazy var columnHeights = [[CGFloat]]()
    private lazy var allItemAttributes = [UICollectionViewLayoutAttributes]()
    private lazy var sectionItemAttributes = [[UICollectionViewLayoutAttributes]]()
    private lazy var cachedItemSizes = [IndexPath: CGSize]()
    
    internal weak var delegate: GirdLayoutDelegate?
    
    internal override func prepare() {
        super.prepare()
        cleaunup()
        
        guard let collectionView = collectionView else { return }
        guard let delegate = delegate else { return }
        
        let numberOfSections = collectionView.numberOfSections
        if numberOfSections == 0 { return }
        
        (0..<numberOfSections).forEach { section in
            let columnCount = collectionViewColumn(for: section)
            columnHeights.append(Array(repeating: 0.0, count: columnCount))
        }
        print("columnHeights:", columnHeights)
        
        var position: CGFloat = 0.0
        (0..<numberOfSections).forEach { section in
            layoutHeader(position: &position, collectionView: collectionView, delegate: delegate, section: section)
            layoutItems(position: position, collectionView: collectionView, delegate: delegate, section: section)
            layoutFooter(position: &position, collectionView: collectionView, delegate: delegate, section: section)
        }
    }
    
    internal override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView, collectionView.numberOfSections > 0  else {
            return .zero
        }
        var contentSize = collectionView.bounds.size
        contentSize.height = columnHeights.last?.first ?? estimatedItemSize.height
        return contentSize
    }
    
    internal override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if indexPath.section >= sectionItemAttributes.count {
            return nil
        }
        if indexPath.item >= sectionItemAttributes[indexPath.section].count {
            return nil
        }
        return sectionItemAttributes[indexPath.section][indexPath.item]
    }
    
    internal override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = allItemAttributes.filter { rect.intersects($0.frame) }
        attributes.forEach{ layoutAttributes in
            if let newFrame = layoutAttributesForItem(at: layoutAttributes.indexPath)?.frame {
                layoutAttributes.frame = newFrame
            }
        }
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else { return false }
        return !newBounds.size.equalTo(collectionView.bounds.size)
    }
    
    override public func shouldInvalidateLayout(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> Bool {
        let shouldInvalidateLayout = cachedItemSizes[originalAttributes.indexPath] != preferredAttributes.size
        return shouldInvalidateLayout
    }
    
    override public func invalidationContext(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forPreferredLayoutAttributes: preferredAttributes, withOriginalAttributes: originalAttributes)
        guard let _ = collectionView else { return context }
        
        let oldContentSize = self.collectionViewContentSize
        cachedItemSizes[originalAttributes.indexPath] = preferredAttributes.size
        
        
        let newContentSize = self.collectionViewContentSize
        context.contentSizeAdjustment = CGSize(width: 0, height: newContentSize.height - oldContentSize.height)
        
        _ = context.invalidateEverything
        return context
    }
    
    private func cleaunup() {
        headersAttribute.removeAll()
        footersAttribute.removeAll()
        columnHeights.removeAll()
        allItemAttributes.removeAll()
        sectionItemAttributes.removeAll()
    }
    
    private func invalidateLayoutIfChanged<T: Equatable>(_ old: T, _ new: T) {
        if old != new { invalidateLayout() }
    }
    
    private func layoutHeader(position: inout CGFloat, collectionView: UICollectionView,  delegate: GirdLayoutDelegate, section: Int) {
        let columnCount = collectionViewColumn(for: section)
        let headerHeight = self.headerHeight(for: section)
        let headerInset = self.headerInset(for: section)
        
        position += headerInset.top
        
        if headerHeight > 0 {
            let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, with: [section, 0])
            attributes.frame = CGRect(
                x: headerInset.left,
                y: position,
                width: collectionView.bounds.width - (headerInset.left + headerInset.right),
                height: headerHeight
            )
            headersAttribute[section] = attributes
            allItemAttributes.append(attributes)
            
            position = attributes.frame.maxY + headerInset.bottom
        }
        
        position += sectionInset(for: section).top
        columnHeights[section] = Array(repeating: position, count: columnCount)
    }
    
    private func pickColumn(itemIndex: Int,
                            delegate: GirdLayoutDelegate,
                            section: Int) -> Int {
        
        var minIndex: Int = 0
        var minValue = CGFloat.greatestFiniteMagnitude
        columnHeights[section].enumerated().forEach { (index, element) in
            if element < minValue {
                minIndex = index
                minValue = element
            }
        }
        return minIndex
    }
    
    private func layoutItems(position: CGFloat, collectionView: UICollectionView, delegate: GirdLayoutDelegate, section: Int) {
        let sectionInset = self.sectionInset(for: section)
        let minimumInteritemSpacing = self.minimumInteritemSpacing(for: section)
        let minimumLineSpacing = self.minimumInteritemSpacing(for: section)
        
        let columnCount = collectionViewColumn(for: section)
        let itemCount = collectionView.numberOfItems(inSection: section)
        
        let firstPaddingLeft = minimumInteritemSpacing
        let width = (collectionView.bounds.width - firstPaddingLeft*2) - (sectionInset.left + sectionInset.right)
        
        let itemWidth = floor((width - CGFloat(columnCount - 1) * minimumLineSpacing) / CGFloat(columnCount))
        
        let paddingLeft = itemWidth + minimumLineSpacing
        
        //print("section:", section ,"paddingLeft:", paddingLeft)
        
        var itemAttributes: [UICollectionViewLayoutAttributes] = []
        
        (0..<itemCount).forEach { index in
            let indexPath: IndexPath = [section, index]
            let columnIndex = pickColumn(itemIndex: index, delegate: delegate, section: section)
            let itemHeight: CGFloat
            let itemSize = delegate.collectionView(collectionView, layout: self, sizeForItemAt: indexPath)

            switch itemSize {
            case .auto:
                itemHeight = cachedItemSizes[indexPath]?.height ?? 0
                let offsetY: CGFloat = columnHeights[section][columnIndex]
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = CGRect(
                    x: sectionInset.left + paddingLeft * CGFloat(columnIndex) + firstPaddingLeft,
                    y: offsetY,
                    width: itemWidth,
                    height: itemHeight
                )
                itemAttributes.append(attributes)
                columnHeights[section][columnIndex] = attributes.frame.maxY + minimumInteritemSpacing
                
            case .fit(let height):
                itemHeight = CGFloat(height)
                let offsetY: CGFloat = columnHeights[section][columnIndex]
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = CGRect(
                    x: sectionInset.left + paddingLeft * CGFloat(columnIndex) + firstPaddingLeft,
                    y: offsetY,
                    width: itemWidth,
                    height: itemHeight
                )
                itemAttributes.append(attributes)
                columnHeights[section][columnIndex] = attributes.frame.maxY + minimumInteritemSpacing
                
            case .square:
                itemHeight = itemWidth
                let offsetY: CGFloat = columnHeights[section][columnIndex]
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = CGRect(
                    x: sectionInset.left + paddingLeft * CGFloat(columnIndex) + firstPaddingLeft,
                    y: offsetY,
                    width: itemWidth,
                    height: itemHeight
                )
                itemAttributes.append(attributes)
                columnHeights[section][columnIndex] = attributes.frame.maxY + minimumInteritemSpacing
                
            case .max(let value):
                if value < Float(itemWidth) {
                    itemHeight = CGFloat(value)
                } else {
                    itemHeight = itemWidth
                }
                let offsetY: CGFloat = columnHeights[section][columnIndex]
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                columnHeights[section][columnIndex] = attributes.frame.maxY + minimumInteritemSpacing
                
                attributes.frame = CGRect(
                    x: sectionInset.left + paddingLeft * CGFloat(columnIndex) + firstPaddingLeft,
                    y: offsetY,
                    width: itemWidth,
                    height: itemHeight
                )
                itemAttributes.append(attributes)
                columnHeights[section][columnIndex] = attributes.frame.maxY + minimumInteritemSpacing
                
            case .size(let width, let height):
                var _width: CGFloat = CGFloat(width)
                if _width > itemWidth {
                    _width = itemWidth
                }
                itemHeight = CGFloat(height)
                let offsetY: CGFloat = columnHeights[section][columnIndex]
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = CGRect(
                    x: (itemWidth - _width)/2 + sectionInset.left + paddingLeft * CGFloat(columnIndex) + firstPaddingLeft,
                    y: offsetY,
                    width: _width,
                    height: itemHeight
                )
                itemAttributes.append(attributes)
                columnHeights[section][columnIndex] = attributes.frame.maxY + minimumInteritemSpacing
            }
            

            
        }
        allItemAttributes.append(contentsOf: itemAttributes)
        sectionItemAttributes.append(itemAttributes)
    }
    
    private func layoutFooter(position: inout CGFloat, collectionView: UICollectionView, delegate: GirdLayoutDelegate, section: Int) {
        let sectionInset = self.sectionInset(for: section)
        let minimumInteritemSpacing = self.minimumInteritemSpacing(for: section)
        let columnCount = collectionViewColumn(for: section)
        let longestColumnIndex = columnHeights[section].enumerated().sorted { $0.element > $1.element }.first?.offset ?? 0
        
        if columnHeights[section].count > 0 {
            position = columnHeights[section][longestColumnIndex] - minimumInteritemSpacing + sectionInset.bottom
        } else {
            position = 0.0
        }
        let footerHeight = self.footerHeight(for: section)
        let footerInset = self.footerInset(for: section)
        position += footerInset.top
        
        if footerHeight > 0.0 {
            let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, with: [section, 0])
            attributes.frame = CGRect(x: footerInset.left, y: position, width: collectionView.bounds.width - (footerInset.left + footerInset.right), height: footerHeight)
            footersAttribute[section] = attributes
            allItemAttributes.append(attributes)
            position = attributes.frame.maxY + footerInset.bottom
        }
        columnHeights[section] = Array(repeating: position, count: columnCount)
    }
    
    private func minimumInteritemSpacing(for section: Int) -> CGFloat {
        return self.minimumInteritemSpacing
    }
    
    private func minimumLineSpacing(for section: Int) -> CGFloat {
        return self.minimumLineSpacing
    }
    
    private func sectionInset(for section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func headerHeight(for section: Int) -> CGFloat {
        return 0.0
    }
    
    private func headerInset(for section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func footerHeight(for section: Int) -> CGFloat {
        return self.minimumLineSpacing
    }
    
    private func footerInset(for section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func estimatedSizeForItemAt(_ indexPath: IndexPath) -> CGSize {
        return self.estimatedItemSize
    }
    
    private func collectionViewColumn(for section: Int) -> Int {
        let column = self.delegate?.collectionViewColumn(for: section) ?? 1
        return column
    }
    
}


