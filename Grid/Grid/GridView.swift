//
//  GridView.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

protocol NameDescribable {
    var typeName: String { get }
    static var typeName: String { get }
}

extension NameDescribable {
    var typeName: String {
        return String(describing: type(of: self))
    }

    static var typeName: String {
        return String(describing: self)
    }
}

extension UIView {
    var className: String {
        return String(describing: self)
    }
}
extension Array: NameDescribable {}
extension UIBarStyle: NameDescribable { }

class GridView: UICollectionView {
    
    private let views: [UIView]
    private let tracks: Int
    
    required init(_ views: UIView..., tracks: Int) {
        self.tracks = tracks
        self.views = views
        super.init(frame: CGRect.zero, collectionViewLayout: self.layout)
        self.backgroundColor = .white
        self.setupCollectionView()
    }
    
    required init(_ views: UIView...) {
        self.views = views
        self.tracks = 1
        super.init(frame: CGRect.zero, collectionViewLayout: self.layout)
        self.backgroundColor = .white
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.layout.minimumLineSpacing = 2
        self.layout.minimumInteritemSpacing = 2
        self.layout.headerHeight = 0
        self.layout.delegate = self
        self.views.forEach {
            self.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: $0.className)
        }
        self.delegate = self
        self.dataSource = self
    }
    
    private let layout: GirdLayout = GirdLayout()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GridView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.views[indexPath.row].className, for: indexPath) as! GridCollectionViewCell
        cell.view = self.views[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.views.count
    }
}

extension GridView: UICollectionViewDelegate {
    
}

extension GridView: GirdLayoutDelegate {
    func collectionViewLayout(for section: Int) -> GirdLayout.Layout {
        return .flow(column: self.tracks)
    }

    func collectionView(_ collectionView: UICollectionView, layout: GirdLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
