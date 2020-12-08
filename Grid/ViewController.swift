//
//  ViewController.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import UIGridView

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        self.view = Grid(attributes:[
            .interitemSpacing(10),
            .lineSpacing(10),
            .sectionInset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)),
            ],
            Content(PadingLabel(text: "Stores"), size: .fit(50)),
            Group(column: 5, size: .size(80, 80),
                  PadingLabel(text: "Email"),
                  PadingLabel(text: "Todo"),
                  PadingLabel(text: "Contact"),
                  PadingLabel(text: "Photo"),
                  PadingLabel(text: "Event")
            ),
            Group(column: 3, size: .fit(40),
                  PadingLabel(text: "Email"),
                  PadingLabel(text: "Todo"),
                  PadingLabel(text: "Contact")),
            Group(column: 3, size: .auto,
                  PadingLabel(text: "1ahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkj1\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkj", padding: 8),
                  PadingLabel(text: "1ahgsdfkjhasgdkjfhgask\njdfhgaskjdhfgkasjhdfgkjashdgf kshjdfgkjashdgfkj\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkj 1ahgsdfkjhasgdkjfh\ngaskjdfhgaskjdhfgkasjhdfgkjashdgf kshjdfgkjashdgfkj", padding: 8),
                  PadingLabel(text: "1ahgsdfkjh\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjasgdkjfhgaskjd\nfhgaskjdhfgkasjhdfgkjashdgf", padding: 8),
                  PadingLabel(text: "1ahgsdfkjhasgdkjfhgaskjdfhgaskjdhf\ngkasjh\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjdfgkjashdgf", padding: 8),
                  PadingLabel(text: "1ahgsdfkjhasgdkj\nfhgaskjd\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjfhgaskjdhfgkasjhdfgkjashdgf", padding: 8),
                  PadingLabel(text: "1ahgsdfkjhasgdkjfhgaskjdfhgas\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjkjdhfgkas\njhdfgkjashdgf", padding: 8),
                  PadingLabel(text: "1ahgsdfkjhasgdkjfhgask\njdfhgas\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjkjdhfgkasjhdfgkjashdgf", padding: 8),
                  PadingLabel(text: "1ahgsdfkjhasgdkjfhgaskjdfh\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjgask\njdhfgkasjhdfgkjashdgf", padding: 8),
                  PadingLabel(text: "1ahgsdfkjhasgdk\njfhgaskjdfhgaskj\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjdhfgkasjhdfgkjashdgf", padding: 8)
            ),
            Content(PadingLabel(text: "Files"), size: .fit(50)),
            Group(column: 5,
                  size: .square,
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8),
                  PadingLabel(text: "ajshdgfkjhasgdkjf", padding: 8)
            )
        )
    }
    
}

