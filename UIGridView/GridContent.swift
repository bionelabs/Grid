//
//  GridContent.swift
//  UIGridView
//
//  Created by Cao Phuoc Thanh on 12/6/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public func Color(_ color: UIColor) -> Grid.Container {
    let view = UIView()
    view.backgroundColor = color
    return Grid.Container.content((view, .square))
}

public func Content(_ view: UIView, size: Grid.Size = .auto) -> Grid.Container {
    return Grid.Container.content((view, size))
}

public func Group(column: Int = 1, size: Grid.Size = .auto, _ views: UIView...) -> Grid.Container {
    return Grid.Container.group([.column(column),.size(size)], views.map{ ($0, size)})
}

public func Group(attributes: [Grid.GroupAttributes] = [.column(1), .size(.auto)], _ views: UIView...) -> Grid.Container {
    var size: Grid.Size = .auto
    for attibute in attributes {
        if case let Grid.GroupAttributes.size(value) = attibute {
            size = value
            break
        }
    }
    return Grid.Container.group(attributes, views.map{ ($0, size)})
}
