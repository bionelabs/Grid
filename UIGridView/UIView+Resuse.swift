//
//  UIView+Resuse.swift
//  UIGridView
//
//  Created by Cao Phuoc Thanh on 1/20/21.
//  Copyright © 2021 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UIView: ReusableView { }

