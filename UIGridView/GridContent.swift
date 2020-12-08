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
    return Grid.Container.group(column, views.map{ ($0, size)})
}
