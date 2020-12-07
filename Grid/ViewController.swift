//
//  ViewController.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import UIGridView

class PadingLabel: UILabel {
    var insets = UIEdgeInsets.zero
    
    /// Добавляет отступы
    func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
}


class DynamicTextView: UIView {
    
    let label: PadingLabel = {
        let view = PadingLabel()
        view.padding(4, 4, 4, 4)
        view.textColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 14)
        view.textAlignment = .center
        view.numberOfLines = 0
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.label.backgroundColor = UIColor.random
        self.label.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init frame:", self.frame)
        //self.backgroundColor = UIColor.random
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v]-8-|", options: [], metrics: nil, views: ["v": label]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v(>=50)]-8-|", options: [], metrics: nil, views: ["v": label]))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



class Header: PadingLabel {
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.backgroundColor = UIColor.clear
        self.textColor = UIColor.gray
        self.padding(8, 8, 8, 8)
        self.font = UIFont.boldSystemFont(ofSize: 16)
        self.textAlignment = .left
        self.numberOfLines = 0
        self.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.random
        self.textColor = UIColor.white
        self.font = UIFont.boldSystemFont(ofSize: 20)
        self.textAlignment = .center
        self.numberOfLines = 0
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Label: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.random
        self.textColor = UIColor.white
        self.font = UIFont.boldSystemFont(ofSize: 20)
        self.textAlignment = .center
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 16
        self.numberOfLines = 0
        self.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.random
        self.textColor = UIColor.white
        self.font = UIFont.boldSystemFont(ofSize: 20)
        self.textAlignment = .center
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        self.view = Grid(
            .interitemSpacing(10),
            .lineSpacing(10),
            .sectionInset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)),
            Content(Header(text: "Stores"), size: .fit(50)),
            Group(column: 5,
                  size: .square,
                  DynamicTextView(text: "Email"),
                  DynamicTextView(text: "Todo"),
                  DynamicTextView(text: "Contact"),
                  DynamicTextView(text: "Photo"),
                  DynamicTextView(text: "Event")
            ),
            Content(Header(text: "Recent Files"), size: .fit(50)),
            Group(column: 3,
                  size: .auto,
                  DynamicTextView(text: "1ahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkj1\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkj"),
                  DynamicTextView(text: "1ahgsdfkjhasgdkjfhgask\njdfhgaskjdhfgkasjhdfgkjashdgf kshjdfgkjashdgfkj\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkj 1ahgsdfkjhasgdkjfh\ngaskjdfhgaskjdhfgkasjhdfgkjashdgf kshjdfgkjashdgfkj"),
                  DynamicTextView(text: "1ahgsdfkjh\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjasgdkjfhgaskjd\nfhgaskjdhfgkasjhdfgkjashdgf"),
                  DynamicTextView(text: "1ahgsdfkjhasgdkjfhgaskjdfhgaskjdhf\ngkasjh\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjdfgkjashdgf"),
                  DynamicTextView(text: "1ahgsdfkjhasgdkj\nfhgaskjd\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjfhgaskjdhfgkasjhdfgkjashdgf"),
                  DynamicTextView(text: "1ahgsdfkjhasgdkjfhgaskjdfhgas\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjkjdhfgkas\njhdfgkjashdgf"),
                  DynamicTextView(text: "1ahgsdfkjhasgdkjfhgask\njdfhgas\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjkjdhfgkasjhdfgkjashdgf"),
                  DynamicTextView(text: "1ahgsdfkjhasgdkjfhgaskjdfh\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjgask\njdhfgkasjhdfgkjashdgf"),
                  DynamicTextView(text: "1ahgsdfkjhasgdk\njfhgaskjdfhgaskj\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjdhfgkasjhdfgkjashdgf")
            ),
            Content(Header(text: "Files"), size: .fit(50)),
            Group(column: 1,
                  size: .fit(120),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf"),
                  DynamicTextView(text: "ajshdgfkjhasgdkjf")
            )
        )
    }
    
}

