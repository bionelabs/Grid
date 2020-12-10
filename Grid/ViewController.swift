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
        
        self.view = Grid(attributes:[.interitemSpacing(4),
                                     .lineSpacing(4),
                                     .sectionInset(UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)),
            ], Content(PadingLabel(.text("You have an ENCOUNTER tomorrow. Don't foget it. Please go there on time."),
                                   .padding([.all(8)]),
                                   .background(.red),
                                   .textColor(.white),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 14)))
            ), Content(PadingLabel(.text("Menu"),
                                   .padding([.all(8)]),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 16)))
            ), Group(attributes: [.size(.size(110, 80))],
                     PadingLabel(.text("English Anytime"), .background(UIColor.orange.withAlphaComponent(0.7)), .cornerRadius(8)),
                     PadingLabel(.text("Grades & Progress"), .background(UIColor.orange.withAlphaComponent(0.7)), .cornerRadius(8)),
                     PadingLabel(.text("Learning Goals"), .background(UIColor.orange.withAlphaComponent(0.7)), .cornerRadius(8)),
                     PadingLabel(.text("DS Workbooks"), .background(UIColor.orange.withAlphaComponent(0.7)), .cornerRadius(8)),
                     PadingLabel(.text("Practice"), .background(UIColor.orange.withAlphaComponent(0.7)), .cornerRadius(8)),
                     PadingLabel(.text("Booking"), .background(UIColor.orange.withAlphaComponent(0.7)), .cornerRadius(8)),
                     PadingLabel(.text("Coffee Meetup"), .background(UIColor.orange.withAlphaComponent(0.7)), .cornerRadius(8))
            ), Content(PadingLabel(.text("Learning Goals"),
                                   .padding([.all(8)]),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 16)))
            ),Group(attributes: [.column(3), .size(.auto)],
                    PadingLabel(.padding([.all(0)]),
                                .text("Communication"),
                                .font(UIFont.boldSystemFont(ofSize: 14)),
                                .textColor(.black),
                                .background(.clear),
                                .textAlignment(.center)),
                    PadingLabel(.padding([.all(0)]),
                                .text("Vocabulary"),
                                .font(UIFont.boldSystemFont(ofSize: 14)),
                                .textColor(.black),
                                .background(.clear),
                                .textAlignment(.center)),
                    PadingLabel(.padding([.all(0)]),
                                .text("Grammar"),
                                .font(UIFont.boldSystemFont(ofSize: 14)),
                                .textColor(.black),
                                .background(.clear),
                                .textAlignment(.center))
            ), Group(attributes: [.column(3), .size(.size(80, 80))],
                     PadingLabel(.padding([.all(0)]),
                                 .text("23/40"),
                                 .font(UIFont.boldSystemFont(ofSize: 24)),
                                 .textColor(.orange),
                                 .cornerRadius(16),
                                 .background(UIColor.lightGray.withAlphaComponent(0.3)),
                                 .textAlignment(.center)),
                     PadingLabel(.padding([.all(0)]),
                                 .text("18/40"),
                                 .font(UIFont.boldSystemFont(ofSize: 24)),
                                 .textColor(.orange),
                                 .cornerRadius(16),
                                 .background(UIColor.lightGray.withAlphaComponent(0.3)),
                                 .textAlignment(.center)),
                     PadingLabel(.padding([.all(0)]),
                                 .text("18/40"),
                                 .font(UIFont.boldSystemFont(ofSize: 24)),
                                 .textColor(.orange),
                                 .cornerRadius(16),
                                 .background(UIColor.lightGray.withAlphaComponent(0.3)),
                                 .textAlignment(.center))
            ),Content(PadingLabel(.text("Your Daily Shedules Learning"),
                                  .padding([.all(8)]),
                                  .background(.clear),
                                  .textColor(.black),
                                  .textAlignment(.left),
                                  .font(UIFont.systemFont(ofSize: 16)))
            ), Group(attributes: [.column(1), .size(.auto)],
                     PadingLabel(.padding([.all(16)]),
                                 .text("[7:00 a.m] Do Media Lesson 1 Level 6"),
                                 .font(UIFont.systemFont(ofSize: 14)),
                                 .textAlignment(.left)),
                     PadingLabel(.padding([.all(16)]),
                                 .text("[8:30 a.m] Do Workbooks Level 6"),
                                 .font(UIFont.systemFont(ofSize: 14)),
                                 .textAlignment(.left)),
                     PadingLabel(.padding([.all(16)]),
                                 .text("[9:30 a.m] Encounter at Thao Dien Center"),
                                 .font(UIFont.systemFont(ofSize: 14)),
                                 .textAlignment(.left)),
                     PadingLabel(.padding([.all(16)]),
                                 .text("[3:30 p.m] Scial class at DB coffee with Petter Pan"),
                                 .font(UIFont.systemFont(ofSize: 14)),
                                 .textAlignment(.left))
            ), Content(PadingLabel(.text("Level Focus - Level 6"),
                                   .padding([.all(8)]),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 16)))
            ), Group(attributes: [.column(2), .size(.auto)],
                     PadingLabel(.text("Can name very common types of holiday."),
                                 .padding([.all(8)])),
                     PadingLabel(.text("Can use very basic language related to getting aound the city."),
                                 .padding([.all(8)])),
                     PadingLabel(.text("Can describe every every day movements using basic prepositions"),
                                 .padding([.all(8)])),
                     PadingLabel(.text("Can ask information about time, measurment, size and quality with how"),
                                 .padding([.all(8)]))
            ), Content(PadingLabel(.text("Practice"),
                                   .padding([.all(8)]),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 16)))
            ), Group(attributes: [.column(2), .size(.square)],
                     PadingLabel(.text("I love my house"), .padding([.all(8)])),
                     PadingLabel(.text("Going to..."), .padding([.all(8)])),
                     PadingLabel(.text("I study English yesterday"), .padding([.all(8)])),
                     PadingLabel(.text("Improve you vocabolary (1)"), .padding([.all(8)])),
                     PadingLabel(.text("Prononciation - Past simple regular"), .padding([.all(8)])),
                     PadingLabel(.text("Simple past and simple practiciple"), .padding([.all(8)])),
                     PadingLabel(.text("Rainy London"), .padding([.all(8)])),
                     PadingLabel(.text("We need to... souvernirs"), .padding([.all(8)])),
                     PadingLabel(.text("Must and mustn't"), .padding([.all(8)]))
            ), Content(PadingLabel(.text("Sentence Practice Daily"),
                                   .padding([.all(8)]),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 16)))
            ), Group(attributes: [.size(.auto)],
                     PadingLabel(.text("I might be misunderstanding but it might be better to let the user pass the array of colors to that functions rather than hard coding them in it (unless you always want to apply the same gradient)."),
                                 .textAlignment(.left),
                                 .padding([.all(10)]),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("I might be misunderstanding"),
                                 .textAlignment(.left),
                                 .padding([.all(10)]),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Rather than hard coding them in it (unless you always want to apply the same gradient"),
                                 .textAlignment(.left),
                                 .padding([.all(10)]),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Misunderstanding but it might be better to let the user pass the array of colors to that functions"),
                                 .textAlignment(.left),
                                 .padding([.all(10)]),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Better to let the user pass the array of"),
                                 .textAlignment(.left),
                                 .padding([.all(10)]),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Ff you want to use HEX instead of RGBA, just drag a new empty .swift and add below mentioned code"),
                                 .textAlignment(.left),
                                 .padding([.all(10)]),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black)),
                     PadingLabel(.text("Uses only textures and SKSpriteNode, doesn't require UIView"),
                                 .textAlignment(.left),
                                 .padding([.all(10)]),
                                 .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                 .textColor(.black))
                
            )
        )
    }
    
}

