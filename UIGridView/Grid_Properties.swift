//
//  GridProperties.swift
//  UIGridView
//
//  Created by Cao Phuoc Thanh on 12/2/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

public func Color(_ color: UIColor) -> Grid.Element {
    let view = Grid.View()
    view.backgroundColor = color
    return Grid.Element.view(view)
}


public func Button(_ variables: Grid.Variable...) -> Grid.Element {
    let view: Grid.Button = Grid.Button(variables)
    return Grid.Element.view(view)
}

public func Label(_ variables: Grid.Variable...) -> Grid.Element {
    let view: Grid.Label = Grid.Label(variables)
    return Grid.Element.view(view)
}

public func View(_ view: GridContentView) -> Grid.Element {
    return Grid.Element.view(view)
}

public func View(_ variables: Grid.Variable...) -> Grid.Element {
    let view = Grid.View(variables)
    return Grid.Element.view(view)
}

public func Group(tracks: Int = 1, _ contents: Grid.Element...) -> Grid.Element {
    var contentViews: [GridContentView] = []
    for content in contents {
        switch content {
        case .view(let value):
            contentViews.append(value)
        default:
            break
        }
    }
    return Grid.Element.group(tracks, contentViews)
}

public func Group(tracks: Int = 1, _ contents: GridContentView...) -> Grid.Element {
    return Grid.Element.group(tracks, contents)
}
