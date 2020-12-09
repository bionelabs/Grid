//
//  PadingLabel.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 12/8/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class PadingLabel: UILabel {
    
    enum Attributes {
        case font(UIFont)
        case text(String)
        case background(UIColor)
        case textColor(UIColor)
        case padding(CGFloat)
        case cornerRadius(CGFloat)
        case textAlignment(NSTextAlignment)
    }
    
    convenience init(_ attributes: PadingLabel.Attributes...) {
        self.init(frame: .zero)
        for attribute in attributes {1
            switch attribute {
            case .font(let font):
                self.font = font
            case .textAlignment(let value):
                self.textAlignment = value
            case .text(let value):
                self.text = value
            case .background(let value):
                self.backgroundColor = value
            case .cornerRadius(let value):
                self.layer.masksToBounds = true
                self.layer.cornerRadius = value
            case .textColor(let value):
                self.textColor = value
            case .padding(let padding):
                self.frame = CGRect(x: 0, y: 0, width: self.frame.width + padding + padding, height: self.frame.height + padding + padding)
                self.insets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
            }
        }
    }
    
    var insets = UIEdgeInsets.zero
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }
    
    convenience init(text: String, padding: CGFloat) {
        self.init(frame: .zero)
        self.text = text
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + padding + padding, height: self.frame.height + padding + padding)
        self.insets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    convenience init(text: String, insets: UIEdgeInsets) {
        self.init(frame: .zero)
        self.text = text
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + insets.left + insets.right, height: self.frame.height + insets.top + insets.bottom)
        self.insets = insets
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.random
        self.textColor = UIColor.white
        self.font = UIFont.boldSystemFont(ofSize: 16)
        self.textAlignment = .center
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 4
        self.numberOfLines = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
}
