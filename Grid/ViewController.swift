//
//  ViewController.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import UIGridView


extension UIScreen {
    var minSize: CGFloat {
        return CGFloat.minimum(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    }
}

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        self.view = Grid(attributes:[
            .interitemSpacing(10),
            .lineSpacing(10),
            .sectionInset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)),
            ],Content(PadingLabel(.text("Apps"), .padding(8), .background(.clear), .textColor(.black), .textAlignment(.left), .font(UIFont.systemFont(ofSize: 14)))),
              Group(attributes: [.size(.size(Float(UIScreen.main.minSize/5), Float(UIScreen.main.minSize/4)))],
                    PadingLabel(text: "Email"),
                    PadingLabel(text: "Todo"),
                    PadingLabel(text: "Contact"),
                    PadingLabel(text: "Photo"),
                    PadingLabel(text: "Event"),
                    PadingLabel(text: "Music"),
                    PadingLabel(text: "Podcast")
                    ),
              Content(PadingLabel(.text("Daily Task"), .padding(8), .background(.clear), .textColor(.black), .textAlignment(.left), .font(UIFont.systemFont(ofSize: 14)))),
              Group(attributes: [.column(3), .size(.fit(100))],
                    PadingLabel(text: "Email"),
                    PadingLabel(text: "Todo"),
                    PadingLabel(text: "Contact")),
              Content(PadingLabel(.text("Notes"), .padding(8), .background(.clear), .textColor(.black), .textAlignment(.left), .font(UIFont.systemFont(ofSize: 14)))),
              Group(attributes: [.column(3), .size(.auto)],
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
              Content(PadingLabel(.text("Photos"), .padding(8), .background(.clear), .textColor(.black),.textAlignment(.left), .font(UIFont.systemFont(ofSize: 14)))),
              Group(attributes: [.column(5), .size(.square)],
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
            ),
              Content(PadingLabel(.text("Recent Files"), .padding(8), .background(.clear), .textColor(.black),.textAlignment(.left), .font(UIFont.systemFont(ofSize: 14)))),
                Group(attributes: [.size(.fit(60))],
                      PadingLabel(.text("Image.jpg"), .textAlignment(.left), .padding(10), .background(UIColor.lightGray.withAlphaComponent(0.4)), .textColor(.black)),
                      PadingLabel(.text("Image.jpg"), .textAlignment(.left), .padding(10), .background(UIColor.lightGray.withAlphaComponent(0.4)), .textColor(.black)),
                      PadingLabel(.text("Image.jpg"), .textAlignment(.left), .padding(10), .background(UIColor.lightGray.withAlphaComponent(0.4)), .textColor(.black)),
                      PadingLabel(.text("Image.jpg"), .textAlignment(.left), .padding(10), .background(UIColor.lightGray.withAlphaComponent(0.4)), .textColor(.black)),
                      PadingLabel(.text("Image.jpg"), .textAlignment(.left), .padding(10), .background(UIColor.lightGray.withAlphaComponent(0.4)), .textColor(.black)),
                      PadingLabel(.text("Image.jpg"), .textAlignment(.left), .padding(10), .background(UIColor.lightGray.withAlphaComponent(0.4)), .textColor(.black)),
                      PadingLabel(.text("Image.jpg"), .textAlignment(.left), .padding(10), .background(UIColor.lightGray.withAlphaComponent(0.4)), .textColor(.black)),
                      PadingLabel(.text("Image.jpg"), .textAlignment(.left), .padding(10), .background(UIColor.lightGray.withAlphaComponent(0.4)), .textColor(.black)),PadingLabel(.text("Image.jpg"), .textAlignment(.left), .padding(10), .background(UIColor.lightGray.withAlphaComponent(0.4)), .textColor(.black)),
                      PadingLabel(.text("Image.jpg"), .textAlignment(.left), .padding(10), .background(UIColor.lightGray.withAlphaComponent(0.4)), .textColor(.black))
              )
        )
    }
    
}

