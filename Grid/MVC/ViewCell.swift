//
//  CollectionViewCell.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 1/20/21.
//  Copyright © 2021 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ViewCell<T>: UICollectionViewCell {
    
    var item: T
    
    init(item: T) {
        self.item = item
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
