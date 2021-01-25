//
//  GridContent.swift
//  UIGridView
//
//  Created by Cao Phuoc Thanh on 12/6/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public func Image(_ attributes: Grid.View.Image.Attributes...) -> Grid.Container {
    func handler(row: Int, view: Grid.View) -> () {
        let label: Grid.View.Image = view as! Grid.View.Image
        label.backgroundColor = .clear
        label.render(attributes)
    }
    
    let elememt: (
        view: Grid.ViewType,
        size: Grid.Size,
        handle: (Int, Grid.View
        ) -> Void) = (Grid.View.Image.self, .auto, handler)
    return Grid.Container.content(elememt)
}


public func Label(_ attributes: Grid.View.Label.Attributes...) -> Grid.Container {
    func handler(row: Int, view: Grid.View) -> () {
        let label: Grid.View.Label = view as! Grid.View.Label
        label.backgroundColor = .clear
        label.render(attributes)
    }
    
    let elememt: (
        view: Grid.ViewType,
        size: Grid.Size,
        handle: (Int, Grid.View
        ) -> Void) = (Grid.View.Label.self, .auto, handler)
    return Grid.Container.content(elememt)
}

public func List<T, Z: Grid.View>(attributes: [Grid.GroupAttributes] = [.column(1), .size(.auto)], items: [T], handle: @escaping (T, Z) -> Z) -> Grid.Container {
    
    var size: Grid.Size = .auto
    for attibute in attributes {
        if case let Grid.GroupAttributes.size(value) = attibute {
            size = value
            break
        }
    }
    
    var views: [(
        view: Grid.ViewType,
        size: Grid.Size,
        handle: (Int, Grid.View) -> Void
    )] = []
    
    func handler(row: Int, view: Grid.View) -> () {
        let _ = handle(items[row], view as! Z)
    }
    
    for _ in items {
        let elememt: (
            view: Grid.ViewType,
            size: Grid.Size,
            handle: (Int, Grid.View
            ) -> Void) = (Z.self, size, handler)
        views.append(elememt)
    }
    
    return Grid.Container.group(attributes, views)
}
