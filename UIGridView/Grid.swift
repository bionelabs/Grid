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
    
    typealias Element = (view: UIView, size: Grid.Size)
    
    enum Size {
        case size(Float, Float)
        case max(Float)
        case fit(Float)
        case square
        case auto
    }
    
    enum Attributes {
        case lineSpacing(Float)
        case interitemSpacing(Float)
        case sectionInset(UIEdgeInsets)
    }
    
    enum GroupAttributes {
        case column(Int)
        case size(Grid.Size)
    }
    
    enum Container {
        case content(Grid.Element)
        case group([GroupAttributes], [Grid.Element])
        case list(UICollectionViewCell.Type, handleCell: (IndexPath, UICollectionViewCell) -> UICollectionViewCell)
    }
}

public extension Grid {
    
    func render(_ containers: Container...) {
        self.containers = containers
        self.attributes = []
        self.setUpParamesters()
        self.setupCollectionView()
        UIView.animate(withDuration: 0.0) {
            self.reloadData()
        }
    }
    
    func render(attributes: [Attributes], _ containers: Container...) {
        self.containers = containers
        self.attributes = attributes
        self.setUpParamesters()
        self.setupCollectionView()
        UIView.animate(withDuration: 0.0) {
            self.reloadData()
        }
    }
    
}

open class Grid: UICollectionView {
    
    internal typealias ContentView = (view: UIView, size: Grid.Size)
    internal typealias ContentData = (attributes: [GroupAttributes], contents: [ContentView])
    
    internal var types: [UICollectionViewCell.Type] = []
    internal var views: [ContentData] = []
    
    internal var containers: [Container]
    internal var attributes: [Attributes]
    
    internal var cellForIndexPath: ((IndexPath, UICollectionViewCell) -> UICollectionViewCell)? = nil
    
    public init() {
        self.containers = []
        self.attributes = []
        super.init(frame: CGRect.zero, collectionViewLayout: self.layout)
        self.backgroundColor = .white
        self.layout.estimatedItemSize = GirdLayout.automaticSize
        self.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        self.layout.headerHeight = 0
        self.setUpParamesters()
        self.setupCollectionView()
    }
    
    internal func setUpParamesters() {
        
        for attribute in self.attributes {
            switch attribute {
            case .interitemSpacing(let value):
                self.layout.minimumInteritemSpacing = CGFloat(value)
            case .lineSpacing(let value):
                self.layout.minimumLineSpacing = CGFloat(value)
            case .sectionInset(let value):
                self.layout.sectionInset = value
            }
        }
        
        self.views = []
        self.types = []
        for param in self.containers {
            switch param {
            // views
            case .group(let attributes, let value):
                let contentView: [ContentView] = value.map { ($0.view, $0.size)}
                self.views.append((attributes, contentView))
            case .content(let value):
                self.views.append(([.column(1)], [(value.view, value.size)]))
            case .list(let value, let handler):
                self.types.append(value)
                self.cellForIndexPath = handler
                }
        }
    }
    
    internal func setupCollectionView() {
        self.layout.delegate = self
        self.views.map{ $0.contents }.flatMap{ $0 }.forEach {
            self.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: type(of: $0.view).reuseIdentifier)
        }
        self.types.forEach {
            print("$0.reuseIdentifier:", $0, $0.reuseIdentifier)
            self.register($0, forCellWithReuseIdentifier: $0.reuseIdentifier)
        }
        self.delegate = self
        self.dataSource = self
    }
    
    internal let layout: GirdLayout = GirdLayout()
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Grid: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.views.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = self.views[indexPath.section].contents[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type(of: view.view).reuseIdentifier, for: indexPath) as! GridCollectionViewCell
        cell.view = view.view
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.views[section].contents.count
    }
}

extension Grid: UICollectionViewDelegate {
    
}

extension Grid: GirdLayoutDelegate {
    
    func collectionViewColumn(for section: Int) -> Int {
        var column: Int = 0
        var size: Grid.Size = .auto
        for atribute in self.views[section].attributes {
            
            switch atribute {
            case .column(let value):
                column =  value
            case .size(let value):
                size = value
            }
        }
        
        if column == 0, case let Grid.Size.size(width, _) = size {
            return Int((self.bounds.width)/(CGFloat(width) - (self.layout.minimumInteritemSpacing*2)))
        }
        
        if column == 0 {
            return 1
        }
        
        return column
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: GirdLayout, sizeForItemAt indexPath: IndexPath) -> Grid.Size {
        let view = self.views[indexPath.section].contents[indexPath.row]
        return view.size
    }
}
