//
//  Grid_View.swift
//  UIGridView
//
//  Created by Cao Phuoc Thanh on 12/2/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public protocol GridContentView {
    // associatedtype Item where Item.Type == UIView.Type
    var width: Float {get set}
    var height: Float { get set }
    var identifier: String { get set }
    init(_ variables: [Grid.Variable])
    init(_ variables: Grid.Variable...)
    func set(_ variable: Grid.Variable)
}

extension Grid {
    
    open class Label: UILabel, GridContentView {
        
        public func set(_ variable: Grid.Variable) {
            switch variable {
            case .color(let value):
                self.backgroundColor = value
            case .title(let value):
                self.text = value
            case .height(let value):
                self.height = value
            case .width(let value):
                self.width = value
            case .textAlignment(let value):
                self.textAlignment = value
            case .cornerRadius(let value):
                self.layer.cornerRadius = CGFloat(value)
            case .masksToBounds(let value):
                self.layer.masksToBounds = value
            default:
                break
            }
        }
        
        public required init(_ variables: [Grid.Variable]) {
            super.init(frame: .zero)
            for variable in variables {
                self.set(variable)
            }
        }
        
        public required convenience init(_ variables: Grid.Variable...) {
            self.init(variables)
        }
        
        required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        //public typealias Item = UIView
        public var width: Float = 0.0
        public var height: Float = 0.0
        public var identifier: String = UUID().uuidString
        
        
    }
    
    open class View: UIView, GridContentView {
        
        public func set(_ variable: Grid.Variable) {
            switch variable {
            case .color(let value):
                self.backgroundColor = value
            case .height(let value):
                self.height = value
            case .width(let value):
                self.width = value
            case .cornerRadius(let value):
                self.layer.cornerRadius = CGFloat(value)
            case .masksToBounds(let value):
                self.layer.masksToBounds = value
            default:
                break
            }
        }
        
        public required init(_ variables: [Grid.Variable]) {
            super.init(frame: .zero)
            for variable in variables {
                self.set(variable)
            }
        }
        
        public required convenience init(_ variables: Grid.Variable...) {
            self.init(variables)
        }
        
        required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        //public typealias Item = UIView
        public var width: Float = 0.0
        public var height: Float = 0.0
        public var identifier: String = UUID().uuidString
    }
    
    open class Button: UIButton, GridContentView {
        
        public func set(_ variable: Grid.Variable) {
            switch variable {
            case .color(let value):
                self.backgroundColor = value
            case .height(let value):
                self.height = value
            case .width(let value):
                self.width = value
            case .cornerRadius(let value):
                self.layer.cornerRadius = CGFloat(value)
            case .masksToBounds(let value):
                self.layer.masksToBounds = value
            case .title(let value):
                self.setTitle(value, for: .normal)
            case .textAlignment(let value):
                self.titleLabel?.textAlignment = value
            default:
                break
            }
        }
        
        public required init(_ variables: [Grid.Variable]) {
            super.init(frame: .zero)
            for variable in variables {
                self.set(variable)
            }
        }
        
        public required convenience init(_ variables: Grid.Variable...) {
            self.init(variables)
        }
        
        required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        //public typealias Item = UIView
        public var width: Float = 0.0
        public var height: Float = 0.0
        public var identifier: String = UUID().uuidString
        
        private var calback: (() -> Void)? = nil
        
        @objc dynamic private func pressButton() {
            self.calback?()
        }
        
        public func tap(_ calback: @escaping (() -> Void)) {
            self.addTarget(self, action: #selector(self.pressButton), for: .touchUpInside)
            self.calback = calback
        }
        
    }
    
    public class ColorView: UIView, GridContentView {
        
        public var width: Float = 0
        
        public var height: Float = 0
        
        public var identifier: String = UUID().uuidString
        
        public func set(_ variable: Grid.Variable) {
            switch variable {
            case .color(let value):
                self.backgroundColor = value
            case .height(let value):
                self.height = value
            case .width(let value):
                self.width = value
            case .cornerRadius(let value):
                self.layer.cornerRadius = CGFloat(value)
            case .masksToBounds(let value):
                self.layer.masksToBounds = value
            default:
                break
            }
        }
        
        public required init(_ variables: [Grid.Variable]) {
            super.init(frame: .zero)
            for variable in variables {
                self.set(variable)
            }
        }
        
        public required convenience init(_ variables: Grid.Variable...) {
            self.init(variables)
        }
        
        public required convenience init(_ color: UIColor) {
            self.init(.color(color))
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}


