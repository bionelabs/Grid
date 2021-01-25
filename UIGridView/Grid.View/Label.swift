//
//  Label.swift
//  UIGridView
//
//  Created by Cao Phuoc Thanh on 24/01/2021.
//  Copyright © 2021 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public extension Grid.View {
    
    class Label: Grid.View {
        
        public enum Attributes {
            case font(UIFont)
            case text(String)
            case background(UIColor)
            case textColor(UIColor)
            case cornerRadius(CGFloat)
            case textAlignment(NSTextAlignment)
        }
        
        internal let label: UILabel = UILabel()
        
        public func render(_ attributes: [Grid.View.Label.Attributes]) {
            for attribute in attributes {
                switch attribute {
                case .font(let font):
                    self.label.font = font
                case .textAlignment(let value):
                    self.label.textAlignment = value
                case .text(let value):
                    self.label.text = value
                case .background(let value):
                    self.label.backgroundColor = value
                case .cornerRadius(let value):
                    self.label.layer.masksToBounds = true
                    self.label.layer.cornerRadius = value
                case .textColor(let value):
                    self.label.textColor = value
                }
            }
            self.layoutIfNeeded()
        }
        
        public var text: String? {
            get{
                return self.label.text
            }
            set{
                self.label.text = newValue
            }
        }
        
        public override func prepareForReuse() {
            super.prepareForReuse()
            self.text = nil
        }
        
        public init(text: String) {
            super.init(frame: .zero)
            self.backgroundColor = UIColor.clear
            self.label.textColor = UIColor.white
            self.label.textAlignment = .center
            self.layer.masksToBounds = true
            self.layer.cornerRadius = 0
            self.label.numberOfLines = 0
            self.label.text = text
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.contentView.addSubview(label)
            self.label.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v(>=0)]-0-|", options: [], metrics: nil, views: ["v": label]))
            self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v(>=0)]-0-|", options: [], metrics: nil, views: ["v": label]))
            self.backgroundColor = UIColor.random
            self.label.textColor = UIColor.white
            self.label.textAlignment = .center
            self.label.numberOfLines = 0
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
    }
}



