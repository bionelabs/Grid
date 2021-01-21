//
//  GridCollectionViewCell.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension Grid {
    
    internal class View: UICollectionViewCell {
        
        private var _view: UIView?

        var view: UIView? {
            get {
                return self._view
            }
            set {
                if let view = newValue {
                    if let oldView = self._view {
                        oldView.removeFromSuperview()
                    }
                    self._view = newValue
                    self.contentView.addSubview(view)
                    view.translatesAutoresizingMaskIntoConstraints = false
                    
                    let contraints: [NSLayoutConstraint] =
                        NSLayoutConstraint.constraints(
                            withVisualFormat: "H:|-0-[v]-0-|",
                            options: [],
                            metrics: nil,
                            views: ["v": view]
                        ) + NSLayoutConstraint.constraints(
                            withVisualFormat: "V:|-0-[v]-0-|",
                            options: [],
                            metrics: nil,
                            views: ["v": view]
                        )
                    
                    self.contentView.addConstraints(contraints)
                } else {
                    print("SDJHGFDJSGDFJSD")
                }
            }
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = .lightGray
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
}
