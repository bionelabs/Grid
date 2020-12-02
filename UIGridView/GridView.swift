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

public func Color(_ color: UIColor) -> Grid.Element {
    let view = UIView()
    view.backgroundColor = color
    return Grid.Element.view((100.0, 100.0, view, UUID().uuidString))
}

public func View(width: Float, height: Float, view: UIView) -> Grid.Element {
    return Grid.Element.group(1, [(width, height, view, UUID().uuidString)])
}

public func Group(tracks: Int = 1, _ views: (width: Float, height: Float, view: UIView)...) -> Grid.Element {
    let contents: [Content] = views.map {
        ($0.width, $0.height, $0.view, UUID().uuidString)
    }
    return Grid.Element.group(tracks, contents)
}

public typealias Content = (width: Float, height: Float, view: UIView, identifier: String)

public extension Grid {
    
    enum Element {
        case lineSpacing(Float)
        case interitemSpacing(Float)
        case view(Content)
        case group(Int, [Content])
        case sectionInset(UIEdgeInsets)
    }
}

public class Grid: UICollectionView {
    
    private var views: [(Int, [Content])] = []
    
    private var elements: [Element]
    
    public required init(_ elements: Element...) {
        self.elements = elements
        super.init(frame: CGRect.zero, collectionViewLayout: self.layout)
        self.backgroundColor = .white
        self.layout.headerHeight = 0
        self.setUpParamesters()
        self.setupCollectionView()
        
    }
    
    private func setUpParamesters() {
        for param in self.elements {
            switch param {
            case .view(let value):
                self.views.append((1, [value]))
            case .interitemSpacing(let value):
                self.layout.minimumInteritemSpacing = CGFloat(value)
            case .lineSpacing(let value):
                self.layout.minimumLineSpacing = CGFloat(value)
            case .group(let tracks, let value):
                self.views.append((tracks, value))
            case .sectionInset(let value):
                self.layout.sectionInset = value
            }
        }
        
    }
    
    private func setupCollectionView() {
        self.layout.delegate = self
        self.views.map{ $0.1 }.flatMap{ $0 }.forEach {
            self.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: $0.identifier)
        }
        self.delegate = self
        self.dataSource = self
    }
    
    private let layout: GirdLayout = GirdLayout()
    
    required init?(coder: NSCoder) {
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
    
    func collectionViewLayout(for section: Int) -> GirdLayout.Layout {
        return .waterfall(column: self.views[section].0, distributionMethod: .balanced)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: GirdLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let view = self.views[indexPath.section].1[indexPath.row]
        return CGSize(width: CGFloat(view.width), height: CGFloat(view.height))
    }
}
