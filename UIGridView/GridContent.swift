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

public func ForEach<T>(attributes: [Grid.GroupAttributes] = [.column(1), .size(.auto)], items: [T], handle: (T) -> UIView) -> Grid.Container {
    var size: Grid.Size = .auto
    for attibute in attributes {
        if case let Grid.GroupAttributes.size(value) = attibute {
            size = value
            break
        }
    }
    
    var views: [UIView] = []
    for item in items {
        views.append(handle(item))
    }
    return Grid.Container.group(attributes, views.map{ ($0, size)})
}


public func ForEach<T>(_ items: [T], handle: (T) -> UIView) -> Grid.Container {
    var views: [UIView] = []
    for item in items {
        views.append(handle(item))
    }
    return Grid.Container.group([.size(.auto), .column(1)], views.map{ ($0, .auto)})
}

//public func List<T: UICollectionViewCell, Z>(cell: T.Type, items: [Z], handle: @escaping (T, Z) -> T) -> Grid.Container {
//    return Grid.Container.list(cell, handleCell: { indexPath, cell in
//        let item = items[indexPath.row]
//        return handle(cell as! T, item)
//    })
//}
