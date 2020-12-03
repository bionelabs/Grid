//
//  GridVariable.swift
//  UIGridView
//
//  Created by Cao Phuoc Thanh on 12/2/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public extension Grid {
    
    typealias Item = UIView
            
    enum Variable {
        case masksToBounds(Bool)
        case cornerRadius(Float)
        case title(String)
        case color(UIColor)
        case height(Float)
        case width(Float)
        case textAlignment(NSTextAlignment)
    }
    
    enum Element {
        case lineSpacing(Float)
        case interitemSpacing(Float)
        case view(GridContentView)
        case group(Int, [GridContentView])
        case sectionInset(UIEdgeInsets)
    }
}
