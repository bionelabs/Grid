//
//  Grid.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public extension Grid {
    
    typealias ViewType = Grid.View.Type
    
    typealias Element = (view: Grid.ViewType, size: Grid.Size, handle: (Int, Grid.View) -> Void)
    
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
    }
}

public extension Grid {
    
    func render(_ containers: Container...) {
        self.containers = containers
        self.attributes = []
        self.setupParamesters()
        self.setupCollectionView()
        UIView.animate(withDuration: 0.0) {
            self.reloadData()
        }
    }
    
    func render(attributes: [Attributes], _ containers: Container...) {
        self.containers = containers
        self.attributes = attributes
        self.setupParamesters()
        self.setupCollectionView()
        UIView.animate(withDuration: 0.0) {
            self.reloadData()
        }
    }
    
}

open class Grid: UICollectionView {
    
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
        self.setupParamesters()
        self.setupCollectionView()
    }
    
    internal func setupParamesters() {
        
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
    }
    
    internal func setupCollectionView() {
        self.layout.delegate = self
        for container in self.containers {
            switch container {
            case .content(let element):
                self.register(element.view, forCellWithReuseIdentifier: element.view.reuseIdentifier)
            case .group(_, let elements):
                elements.forEach { (element) in
                    self.register(element.view, forCellWithReuseIdentifier: element.view.reuseIdentifier)
                }
            }
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
        return self.containers.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let container: Grid.Container = self.containers[indexPath.section]
        switch container {
        case .content(let element):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: element.view.reuseIdentifier, for: indexPath) as! Grid.View
            element.handle(indexPath.row, cell)
            return cell
        case .group(_, let elements):
            let element = elements[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: element.view.reuseIdentifier, for: indexPath) as! Grid.View
            element.handle(indexPath.row, cell)
            return cell
        }
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let container: Grid.Container = self.containers[section]
        switch container {
        case .content(_):
            return 1
        case .group(_, let elements):
            return elements.count
        }
    }
}

extension Grid: UICollectionViewDelegate {
    
}

extension Grid: GirdLayoutDelegate {
    
    func collectionViewColumn(for section: Int) -> Int {
        let container: Grid.Container = self.containers[section]
        switch container {
        case .content(_):
            return 1
        case .group(let attributes, _):
            var column: Int = 0
            var size: Grid.Size = .auto
            for atribute in attributes {
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
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: GirdLayout, sizeForItemAt indexPath: IndexPath) -> Grid.Size {
        let container: Grid.Container = self.containers[indexPath.section]
        switch container {
        case .content(let element):
            return element.size
        case .group(_, let elements):
            return elements[indexPath.row].size
        }
    }
}
