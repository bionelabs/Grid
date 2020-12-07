//
//  Grid.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension NSObjectProtocol {
    var className: String {
        return String(describing: Self.self)
    }
}

public extension Grid {
    
    typealias Content = (view: UIView, size: Grid.Size)
    
    enum Size {
        
        case fit(Float)
        case square
        case auto
        
        var size: CGSize {
            switch self {
            case .fit(let height):
                return CGSize(width: 0.0, height: Double(height))
            case .square:
                return CGSize(width: 0.0, height: 0.0)
            case .auto:
                return UICollectionViewFlowLayout.automaticSize
            }
        }
        
    }
    
    enum Element {
        case lineSpacing(Float)
        case interitemSpacing(Float)
        case sectionInset(UIEdgeInsets)
        case content(Grid.Content)
        case group(Int, [Grid.Content])
        case view(UIView)
    }
}

public class Grid: UICollectionView {
    
    internal typealias ContentView = (view: UIView, size: CGSize, identifier: String)
    
    internal var views: [(Int, [ContentView])] = []
    
    internal var elements: [Element]
    
    public required init(_ elements: Element...) {
        self.elements = elements
        super.init(frame: CGRect.zero, collectionViewLayout: self.layout)
        self.backgroundColor = .white
        self.layout.estimatedItemSize = GirdLayout.automaticSize
        self.layout.headerHeight = 0
        self.setUpParamesters()
        self.setupCollectionView()
    }
    
    internal func setUpParamesters() {
        for param in self.elements {
            switch param {
                
            // configuations
            case .interitemSpacing(let value):
                self.layout.minimumInteritemSpacing = CGFloat(value)
            case .lineSpacing(let value):
                self.layout.minimumLineSpacing = CGFloat(value)
            case .sectionInset(let value):
                self.layout.sectionInset = value
                
            // views
            case .group(let column, let value):
                let contentView: [ContentView] = value.map { ($0.view, $0.size.size, UUID().uuidString)}
                self.views.append((column, contentView))
            case .view(let value):
                self.views.append((1, [(value, Grid.Size.auto.size, UUID().uuidString)]))
            case .content(let value):
                self.views.append((1, [(value.view, value.size.size, UUID().uuidString)]))
            }
        }
    }
    
    internal func setupCollectionView() {
        self.layout.delegate = self
        self.views.map{ $0.1 }.flatMap{ $0 }.forEach {
            self.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: $0.identifier)
        }
        self.delegate = self
        self.dataSource = self
    }
    
    internal let layout: GirdLayout = GirdLayout()
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Grid: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.views.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = self.views[indexPath.section].1[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: view.identifier, for: indexPath) as! GridCollectionViewCell
        cell.view = view.view
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.views[section].1.count
    }
}

extension Grid: UICollectionViewDelegate {
    
}

extension Grid: GirdLayoutDelegate {
    
    func collectionViewColumn(for section: Int) -> Int {
        return self.views[section].0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: GirdLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let view = self.views[indexPath.section].1[indexPath.row]
        return view.size
    }
}
