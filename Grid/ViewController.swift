//
//  ViewController.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import UIGridView

class Header: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.lightGray
        self.textColor = .white
        self.textAlignment = .center
        self.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        self.textAlignment = .center
        self.textColor = .white
        self.text = "Header"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Label: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.random
        self.textAlignment = .center
        self.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.random
        self.textAlignment = .center
        self.text = "Label"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    let _view: Grid = Grid(
        .interitemSpacing(0),
        .lineSpacing(0),
        .sectionInset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)),
        View(
            .view(Header(text: "HEADER"), 50)
        ),
        Group(tracks: 3,
              .view(Label(text: "1"), 150),
              .view(Label(text: "2"), 50),
              .view(Label(text: "3"), 150),
              .view(Label(text: "4"), 50),
              .view(Label(text: "5"), 50)
        ),
        Group(tracks: 4,
              .square(Label(text: "75")),
              .square(Label(text: "75")),
              .square(Label(text: "75")),
              .square(Label(text: "75"))
        ),
        View(
            .view(Header(text: "HEADER"), 50)
        ),
        Group(tracks: 4,
              .square(Label(text: "75")),
              .view(Label(text: "2"), 50),
              .square(Label(text: "75")),
              .view(Label(text: "2"), 50)
        )
    )
    
    override func loadView() {
        super.loadView()
        self.view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

