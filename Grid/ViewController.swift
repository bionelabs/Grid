//
//  ViewController.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import UIGridView


class DynamicView: UIView {
    
    let label: UIView = {
        return UIView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init frame:", self.frame)
        self.backgroundColor = UIColor.lightGray
        self.addSubview(label)
        //label.text = "ALO HAHAHA"
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v]-|", options: [], metrics: nil, views: ["v": label]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v(100)]-|", options: [], metrics: nil, views: ["v": label]))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class Header: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.lightGray
        self.textColor = .white
        self.textAlignment = .center
        self.numberOfLines = 0
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
        self.numberOfLines = 0
        self.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.random
        self.textAlignment = .center
        self.numberOfLines = 0
        self.text = "Label"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    
    let asdasdasd = DynamicView()
    
    override func loadView() {
        
        self.view = Grid(
            .interitemSpacing(0),
            .lineSpacing(0),
            .sectionInset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)),
            Content(Label(text: "Hello ba con"), size: .fit(350)),
            Content(asdasdasd),
            Group(column: 2,
                  size: .fit(80),
                  Label(text: "1"),
                  Label(text: "2")
            ),
            Group(column: 3,
                  size: .square,
                  Label(text: "1"),
                  Label(text: "2"),
                  Label(text: "3")
            ),
            Content(asdasdasd, size: .fit(30))
        )
    }
    
}

