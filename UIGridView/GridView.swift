//
//  GridCollectionViewCell.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public extension Grid {
    
    class View: UICollectionViewCell {
        
        public override func prepareForReuse() {
            super.prepareForReuse()
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = .lightGray
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private var isHeightCalculated: Bool = false
        
        public override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
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
