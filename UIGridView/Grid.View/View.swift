//
//  View.swift
//  UIGridView
//
//  Created by Cao Phuoc Thanh on 24/01/2021.
//  Copyright © 2021 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public extension Grid {
    
    class View: UICollectionViewCell {
        
        
        public override func prepareForReuse() {
            super.prepareForReuse()
            self.isHeightCalculated = false
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
            setNeedsLayout()
            layoutIfNeeded()

            let preferredLayoutAttributes = layoutAttributes

            var fittingSize = UIView.layoutFittingCompressedSize
            fittingSize.width = preferredLayoutAttributes.size.width
            let size = systemLayoutSizeFitting(fittingSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
            var adjustedFrame = preferredLayoutAttributes.frame
            adjustedFrame.size.height = ceil(size.height)
            preferredLayoutAttributes.frame = adjustedFrame

            return preferredLayoutAttributes
            //return layoutAttributes
        }
    }
}
