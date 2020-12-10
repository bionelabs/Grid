//
//  PadingLabel.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 12/8/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class PadingLabel: UILabel {
    
    enum Inset {
        case left(CGFloat)
        case right(CGFloat)
        case top(CGFloat)
        case bottom(CGFloat)
        case all(CGFloat)
    }
    
    
    enum Attributes {
        case font(UIFont)
        case text(String)
        case background(UIColor)
        case textColor(UIColor)
        case padding([PadingLabel.Inset])
        case cornerRadius(CGFloat)
        case textAlignment(NSTextAlignment)
    }
    
    convenience init(_ attributes: PadingLabel.Attributes...) {
        self.init(frame: .zero)
        for attribute in attributes {
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
                var left: CGFloat = 0
                var right: CGFloat = 0
                var top: CGFloat = 0
                var bottom: CGFloat = 0
                for type in padding {
                    switch type {
                    case .all(let value):
                        left = value
                        right = value
                        top = value
                        bottom = value
                    case .left(let value):
                        left = value
                    case .right(let value):
                        right = value
                    case .bottom(let value):
                        bottom = value
                    case .top(let value):
                        top = value
                    }
                }
                
                self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
                self.insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
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
