//
//  ViewController.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import UIGridView

class ABCView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Header: UILabel {
    
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
        View(width: 100, height: 50, view: Header(text: "Quick Access")),
        Group(tracks: 3,
              (width: 50, height: 50, view: Header(text: "1")),
              (width: 50, height: 50, view: Header(text: "2")),
              (width: 50, height: 50, view: Header(text: "3")),
              (width: 50, height: 50, view: Header(text: "4")),
              (width: 50, height: 50, view: Header(text: "5")),
              (width: 50, height: 50, view: Header(text: "6"))
        ),
        View(width: 100, height: 50, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "7")),
              (width: 100, height: 100, view: Header(text: "8")),
              (width: 100, height: 100, view: Header(text: "9"))
        ),
        View(width: 100, height: 50, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "10")),
              (width: 100, height: 100, view: Header(text: "11")),
              (width: 100, height: 100, view: Header(text: "12"))
        ),
        Group(tracks: 6,
              (width: 50, height: 50, view: Header(text: "1")),
              (width: 50, height: 50, view: Header(text: "2")),
              (width: 50, height: 50, view: Header(text: "3")),
              (width: 50, height: 50, view: Header(text: "4")),
              (width: 50, height: 50, view: Header(text: "5")),
              (width: 50, height: 50, view: Header(text: "6"))
        ),
        View(width: 100, height: 50, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "7")),
              (width: 100, height: 100, view: Header(text: "8")),
              (width: 100, height: 100, view: Header(text: "9"))
        ),
        View(width: 100, height: 50, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "10")),
              (width: 100, height: 100, view: Header(text: "11")),
              (width: 100, height: 100, view: Header(text: "12"))
        ),
        Group(tracks: 6,
              (width: 50, height: 50, view: Header(text: "1")),
              (width: 50, height: 50, view: Header(text: "2")),
              (width: 50, height: 50, view: Header(text: "3")),
              (width: 50, height: 50, view: Header(text: "4")),
              (width: 50, height: 50, view: Header(text: "5")),
              (width: 50, height: 50, view: Header(text: "6"))
        ),
        View(width: 100, height: 50, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "7")),
              (width: 100, height: 100, view: Header(text: "8")),
              (width: 100, height: 100, view: Header(text: "9"))
        ),
        View(width: 100, height: 50, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "10")),
              (width: 100, height: 100, view: Header(text: "11")),
              (width: 100, height: 100, view: Header(text: "12"))
        ),
        Group(tracks: 6,
              (width: 50, height: 50, view: Header(text: "1")),
              (width: 50, height: 50, view: Header(text: "2")),
              (width: 50, height: 50, view: Header(text: "3")),
              (width: 50, height: 50, view: Header(text: "4")),
              (width: 50, height: 50, view: Header(text: "5")),
              (width: 50, height: 50, view: Header(text: "6"))
        ),
        View(width: 100, height: 50, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "7")),
              (width: 100, height: 100, view: Header(text: "8")),
              (width: 100, height: 100, view: Header(text: "9"))
        ),
        View(width: 100, height: 50, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "10")),
              (width: 100, height: 100, view: Header(text: "11")),
              (width: 100, height: 100, view: Header(text: "12"))
        ),
        Group(tracks: 6,
              (width: 50, height: 50, view: Header(text: "1")),
              (width: 50, height: 50, view: Header(text: "2")),
              (width: 50, height: 50, view: Header(text: "3")),
              (width: 50, height: 50, view: Header(text: "4")),
              (width: 50, height: 50, view: Header(text: "5")),
              (width: 50, height: 50, view: Header(text: "6"))
        ),
        View(width: 100, height: 50, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "7")),
              (width: 100, height: 100, view: Header(text: "8")),
              (width: 100, height: 100, view: Header(text: "9"))
        ),
        View(width: 100, height: 40, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "10")),
              (width: 100, height: 100, view: Header(text: "11")),
              (width: 100, height: 100, view: Header(text: "12"))
        ),
        Group(tracks: 6,
              (width: 50, height: 50, view: Header(text: "1")),
              (width: 50, height: 50, view: Header(text: "2")),
              (width: 50, height: 50, view: Header(text: "3")),
              (width: 50, height: 50, view: Header(text: "4")),
              (width: 50, height: 50, view: Header(text: "5")),
              (width: 50, height: 50, view: Header(text: "6"))
        ),
        View(width: 100, height: 40, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "7")),
              (width: 100, height: 100, view: Header(text: "8")),
              (width: 100, height: 100, view: Header(text: "9"))
        ),
        View(width: 100, height: 40, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "10")),
              (width: 100, height: 100, view: Header(text: "11")),
              (width: 100, height: 100, view: Header(text: "12"))
        ),
        Group(tracks: 6,
              (width: 50, height: 50, view: Header(text: "1")),
              (width: 50, height: 50, view: Header(text: "2")),
              (width: 50, height: 50, view: Header(text: "3")),
              (width: 50, height: 50, view: Header(text: "4")),
              (width: 50, height: 50, view: Header(text: "5")),
              (width: 50, height: 50, view: Header(text: "6"))
        ),
        View(width: 100, height: 40, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "7")),
              (width: 100, height: 100, view: Header(text: "8")),
              (width: 100, height: 100, view: Header(text: "9"))
        ),
        View(width: 100, height: 40, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "10")),
              (width: 100, height: 100, view: Header(text: "11")),
              (width: 100, height: 100, view: Header(text: "12"))
        ),
        Group(tracks: 6,
              (width: 50, height: 50, view: Header(text: "1")),
              (width: 50, height: 50, view: Header(text: "2")),
              (width: 50, height: 50, view: Header(text: "3")),
              (width: 50, height: 50, view: Header(text: "4")),
              (width: 50, height: 50, view: Header(text: "5")),
              (width: 50, height: 50, view: Header(text: "6"))
        ),
        View(width: 100, height: 40, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "7")),
              (width: 100, height: 100, view: Header(text: "8")),
              (width: 100, height: 100, view: Header(text: "9"))
        ),
        View(width: 100, height: 40, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "10")),
              (width: 100, height: 100, view: Header(text: "11")),
              (width: 100, height: 100, view: Header(text: "12"))
        ),
        Group(tracks: 6,
              (width: 50, height: 50, view: Header(text: "1")),
              (width: 50, height: 50, view: Header(text: "2")),
              (width: 50, height: 50, view: Header(text: "3")),
              (width: 50, height: 50, view: Header(text: "4")),
              (width: 50, height: 50, view: Header(text: "5")),
              (width: 50, height: 50, view: Header(text: "6"))
        ),
        View(width: 100, height: 40, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "7")),
              (width: 100, height: 100, view: Header(text: "8")),
              (width: 100, height: 100, view: Header(text: "9"))
        ),
        View(width: 100, height: 40, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "10")),
              (width: 100, height: 100, view: Header(text: "11")),
              (width: 100, height: 100, view: Header(text: "12"))
        ),
        Group(tracks: 6,
              (width: 50, height: 50, view: Header(text: "1")),
              (width: 50, height: 50, view: Header(text: "2")),
              (width: 50, height: 50, view: Header(text: "3")),
              (width: 50, height: 50, view: Header(text: "4")),
              (width: 50, height: 50, view: Header(text: "5")),
              (width: 50, height: 50, view: Header(text: "6"))
        ),
        View(width: 100, height: 40, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "7")),
              (width: 100, height: 100, view: Header(text: "8")),
              (width: 100, height: 100, view: Header(text: "9"))
        ),
        View(width: 100, height: 40, view: Header(text: "Preview")),
        Group(tracks: 3,
              (width: 100, height: 100, view: Header(text: "10")),
              (width: 100, height: 100, view: Header(text: "11")),
              (width: 100, height: 100, view: Header(text: "12"))
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

