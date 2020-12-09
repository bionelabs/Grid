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
            ], Content(PadingLabel(.text("Apps"),
                                   .padding(8),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 14)))
            ), Group(attributes: [.size(.size(110, 80))],
                     PadingLabel(.text("Email"), .background(.lightGray), .cornerRadius(8)),
                     PadingLabel(.text("Todo"), .background(.lightGray), .cornerRadius(8)),
                     PadingLabel(.text("Contact"), .background(.lightGray), .cornerRadius(8)),
                     PadingLabel(.text("Photo"), .background(.lightGray), .cornerRadius(8)),
                     PadingLabel(.text("Event"), .background(.lightGray), .cornerRadius(8)),
                     PadingLabel(.text("Music"), .background(.lightGray), .cornerRadius(8))
            ), Content(PadingLabel(.text("Daily Routine"),
                                   .padding(8),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 14)))
            ), Group(attributes: [.column(1), .size(.auto)],
                     PadingLabel(.padding(16),
                                 .text("[7:00 a.m] Wake up"),
                                 .textAlignment(.left)),
                     PadingLabel(.padding(16),
                                 .text("[7:15 a.m] Brush your teeth"),
                                 .textAlignment(.left)),
                     PadingLabel(.padding(16),
                                 .text("[7:30 a.m] Go to work"),
                                 .textAlignment(.left)),
                     PadingLabel(.padding(16),
                                 .text("[8:30 a.m] [Preflo - Build 1.0.2 20112701] Should not show \"more\" for day which having enough space to show events in Month view\n\nhttps://www.pivotaltracker.com/story/show/171401476"),
                                 .textAlignment(.left)),
                     PadingLabel(.padding(16),
                                 .text("[9:30 a.m] [Preflo - Build 1.0.2 2511005] Should not change start/end time of event when drag and drop event in month mode to change duration.\n\n1. Login flo iPad > Event view > Big calendar > Month mode\n2. Event e1 from 4pm 25 Nov to 6pm 25 Nov\n3. Tap and hold event E1 > Drag Right edge to 26 Nov > Tap outside to apply\n4. Tap on Event E1 to open detail\n\nResult:\n4. Event E1 is changed end time. will be: from 4pm 25 Nov to 0am 26 Nov\nExpected:\n4. Event E1 should not be changed end time, It should be form 4pm 25 Nov to 6pm 26 Nov"),
                                 .textAlignment(.left)),
                     PadingLabel(.padding(16),
                                 .text("[3:30 p.m] Do task local filter"),
                                 .textAlignment(.left))
            ), Content(PadingLabel(.text("Recent Notes"),
                                   .padding(8),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 14)))
            ), Group(attributes: [.column(2), .size(.auto)],
                     PadingLabel(text: "1ahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkj1\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkj", padding: 8),
                     PadingLabel(text: "1ahgsdfkjhasgdkjfhgask\njdfhgaskjdhfgkasjhdfgkjashdgf kshjdfgkjashdgfkj\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkj 1ahgsdfkjhasgdkjfh\ngaskjdfhgaskjdhfgkasjhdfgkjashdgf kshjdfgkjashdgfkj", padding: 8),
                     PadingLabel(text: "1ahgsdfkjh\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjasgdkjfhgaskjd\nfhgaskjdhfgkasjhdfgkjashdgf", padding: 8),
                     PadingLabel(text: "1ahgsdfkjhasgdkjfhgaskjdfhgaskjdhf\ngkasjh\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjdfgkjashdgf", padding: 8),
                     PadingLabel(text: "1ahgsdfkjhasgdkj\nfhgaskjd\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjfhgaskjdhfgkasjhdfgkjashdgf", padding: 8),
                     PadingLabel(text: "1ahgsdfkjhasgdkjfhgaskjdfhgas\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjkjdhfgkas\njhdfgkjashdgf", padding: 8),
                     PadingLabel(text: "1ahgsdfkjhasgdkjfhgask\njdfhgas\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjkjdhfgkasjhdfgkjashdgf", padding: 8),
                     PadingLabel(text: "1ahgsdfkjhasgdkjfhgaskjdfh\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjgask\njdhfgkasjhdfgkjashdgf", padding: 8),
                     PadingLabel(text: "1ahgsdfkjhasgdk\njfhgaskjdfhgaskj\nahgsdfkjhasgdkjfhg\naskjdfhgaskjdhfgkasjhd\nfgkjashdgf kshjdfgkjashdgfkjdhfgkasjhdfgkjashdgf", padding: 8)
            ), Content(PadingLabel(.text("Recent Photos"),
                                   .padding(8),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 14)))
            ), Group(attributes: [.column(2), .size(.square)],
                     PadingLabel(.text("Photo.JPG"), .padding(8)),
                     PadingLabel(.text("Photo.JPG"), .padding(8)),
                     PadingLabel(.text("Photo.JPG"), .padding(8)),
                     PadingLabel(.text("Photo.JPG"), .padding(8)),
                     PadingLabel(.text("Photo.JPG"), .padding(8)),
                     PadingLabel(.text("Photo.JPG"), .padding(8)),
                     PadingLabel(.text("Photo.JPG"), .padding(8)),
                     PadingLabel(.text("Photo.JPG"), .padding(8)),
                     PadingLabel(.text("Photo.JPG"), .padding(8))
            ), Content(PadingLabel(.text("Recent Files"),
                                   .padding(8),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 14)))
            ), Group(attributes: [.size(.fit(60))],
                     PadingLabel(.text("Image.jpg"),
                                 .textAlignment(.left),
                                 .padding(10),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Image.jpg"),
                                 .textAlignment(.left),
                                 .padding(10),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Image.jpg"),
                                 .textAlignment(.left),
                                 .padding(10),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Image.jpg"),
                                 .textAlignment(.left),
                                 .padding(10),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Image.jpg"),
                                 .textAlignment(.left),
                                 .padding(10),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Image.jpg"),
                                 .textAlignment(.left),
                                 .padding(10),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Image.jpg"),
                                 .textAlignment(.left),
                                 .padding(10),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Image.jpg"),
                                 .textAlignment(.left),
                                 .padding(10),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black))
                
            )
        )
    }
    
}

