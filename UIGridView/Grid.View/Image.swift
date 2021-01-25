//
//  Image.swift
//  UIGridView
//
//  Created by Cao Phuoc Thanh on 24/01/2021.
//  Copyright © 2021 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public extension Grid.View {
    
    class Image: Grid.View {
        
        public enum Attributes {
            case cornerRadius(CGFloat)
            case background(UIColor)
            case contentMode(UIView.ContentMode)
            case image(UIImage)
            case masksToBounds(Bool)        }
        
        private let imageView: UIImageView = UIImageView()
        
        public func render(_ attributes: Grid.View.Image.Attributes...) {
            self.render(attributes)
        }
        
        public func render(_ attributes: [Grid.View.Image.Attributes]) {
            self.backgroundColor = .clear
            for attribute in attributes {
                switch attribute {
                case .background(let value):
                    self.backgroundColor = value
                case .cornerRadius(let value):
                    self.layer.masksToBounds = true
                    self.layer.cornerRadius = value
                case .contentMode(let value):
                    self.imageView.contentMode = value
                    self.layoutIfNeeded()
                case .image(let value):
                    self.imageView.image = value
                    self.contentView.layoutIfNeeded()
                case .masksToBounds(let value):
                    self.imageView.layer.masksToBounds = value
                }
            }
        }
        
        public var image: UIImage? {
            get{
                return self.imageView.image
            }
            set{
                self.imageView.image = newValue
            }
        }
        
        public init(image: UIImage) {
            super.init(frame: .zero)
            self.image = image
        }
        
        public override func prepareForReuse() {
            super.prepareForReuse()
            self.image = nil
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.contentView.addSubview(imageView)
            self.imageView.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: "V:|-0-[v(>=0)]-0-|",
                    options: [],
                    metrics: nil,
                    views: ["v": imageView]
                )
            )
            self.contentView.addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: "H:|-0-[v(>=0)]-0-|",
                    options: [], metrics: nil,
                    views: ["v": imageView]
                )
            )
            self.backgroundColor = UIColor.clear
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
