//
//  ColorView.swift
//  UIGridView
//
//  Created by Cao Phuoc Thanh on 11/28/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

public extension UIColor {
    static var random: UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}

//public class ColorView: UIView {
//
//    public required init(_ color: UIColor) {
//        super.init(frame: .zero)
//        self.backgroundColor = color
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
