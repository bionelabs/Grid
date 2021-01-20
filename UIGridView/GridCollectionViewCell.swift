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
            if let view = newValue, _view != view {
                UIView.animate(withDuration: 0.0) {
                    self._view?.removeFromSuperview()
                    self.contentView.addSubview(view)
                    view.translatesAutoresizingMaskIntoConstraints = false
                    view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
                    view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
                    view.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
                    view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
                    self._view = newValue
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //self._view?.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var isHeightCalculated: Bool = false
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        if !isHeightCalculated {
            layoutIfNeeded()
            let targetSize = CGSize(width: layoutAttributes.size.width, height: layoutAttributes.size.height)
            let size = contentView.systemLayoutSizeFitting(targetSize)
            var newFrame = layoutAttributes.frame
            newFrame.size.width = CGFloat(ceilf(Float(size.width)))
            newFrame.size.height = CGFloat(ceilf(Float(size.height)))
            layoutAttributes.frame = newFrame
            isHeightCalculated = true
        }
        return layoutAttributes
    }
}
