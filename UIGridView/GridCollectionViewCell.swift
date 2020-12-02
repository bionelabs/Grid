//
//  GridCollectionViewCell.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

internal class GridCollectionViewCell: UICollectionViewCell {
    
    private var _view: UIView?
    
    var view: UIView? {
        get {
            return self._view
        }
        set {
            if let view = newValue {
                self._view?.removeFromSuperview()
                self.contentView.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
                view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
                view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
                self._view = newValue
            }
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self._view?.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
