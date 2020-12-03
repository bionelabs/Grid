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

public class Grid: UICollectionView {
    
    private var views: [(Int, [GridContentView])] = []
    
    private var elements: [Element]
    
    
    public required init(_ input: () -> [GridContentView]) {
        let items = input()
        self.elements = [Element.group(1, items)]
        super.init(frame: CGRect.zero, collectionViewLayout: self.layout)
        self.backgroundColor = .white
        self.layout.estimatedItemSize = GirdLayout.automaticSize
        self.layout.headerHeight = 0
        self.setUpParamesters()
        self.setupCollectionView()
    }
    
    public required init(_ elements: Element...) {
        self.elements = elements
        super.init(frame: CGRect.zero, collectionViewLayout: self.layout)
        self.backgroundColor = .white
        self.layout.estimatedItemSize = GirdLayout.automaticSize
        self.layout.headerHeight = 0
        self.setUpParamesters()
        self.setupCollectionView()
    }
    
    public func load(_ elements: Element...) {
        self.elements = elements
        self.backgroundColor = .white
        self.layout.estimatedItemSize = GirdLayout.automaticSize
        self.layout.headerHeight = 0
        self.setUpParamesters()
        self.setupCollectionView()
        self.reloadData()
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
        let view: GridContentView = self.views[indexPath.section].1[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: view.identifier, for: indexPath) as! GridCollectionViewCell
        switch view {
        case let view as UIView:
            cell.view = view
        default:
            break
        }
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
        return CGSize(width: 0, height: CGFloat(view.height))
    }
}
