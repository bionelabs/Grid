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
    
    
    var girdView: Grid = Grid()
    
    let menuItems: [String] = [
        "English Anytime",
        "Grades & Progress",
        "Learning Goals",
        "DS Workbooks",
        "Practice",
        "Booking",
        "Coffee Meetup"
    ]
    
    let sheduleItems: [String] = [
        "[7:00 a.m] Do Media Lesson 1 Level 6",
        "[8:30 a.m] Do Workbooks Level 6",
        "[9:30 a.m] Encounter at Thao Dien Center",
        "[3:30 p.m] Scial class at DB coffee with Petter Pan"
    ]
    
    let levelFocusItems: [String] = [
        "Can name very common types of holiday.",
        "Can use very basic language related to getting aound the city.",
        "Can ask information about time, measurment, size and quality with how"
    ]
    
    let practiceItems: [String] = [
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't",
        "I love my house",
        "Going to...",
        "I study English yesterday",
        "Improve you vocabolary (1)",
        "Prononciation - Past simple regular",
        "Simple past and simple practiciple",
        "Rainy London",
        "We need to... souvernirs",
        "Must and mustn't"
    ]
    
    let sentencePracticeDailyItems: [String] = [
        "I might be misunderstanding but it might be better to let the user pass the array of colors to that functions rather than hard coding them in it (unless you always want to apply the same gradient).",
        "I might be misunderstanding",
        "Rather than hard coding them in it (unless you always want to apply the same gradient",
        "Misunderstanding but it might be better to let the user pass the array of colors to that functions",
        "Better to let the user pass the array of",
        "Uses only textures and SKSpriteNode, doesn't require UIView"
    ]
    
    
    let scoreTitleItems: [String] = [
        "Communication",
        "Vocabulary",
        "Grammar"
    ]
    let scoreItems: [String] = [
        "23/40",
        "23/40",
        "23/40"
    ]
    
    @objc func random() {
        self.girdView.render(
            Content(PadingLabel(.text("Practice"),
                                .padding([.all(8)]),
                                .background(.clear),
                                .textColor(.black),
                                .textAlignment(.left),
                                .font(UIFont.systemFont(ofSize: 16)))
            ), ForEach(attributes: [.column(Int.random(in: 1...20)), .size(.square)], loop: self.practiceItems.count) {
                return PadingLabel(.text(self.practiceItems[$0]),
                                   .padding([.all(8)]))
            }
        )
    }
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.leftBarButtonItem =  UIBarButtonItem(title: "Randoom", style: .done, target: self, action: #selector(random))
        
        self.view = girdView
        
        girdView.render(attributes:[.interitemSpacing(4),
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
            ), ForEach(attributes: [.size(.size(110, 80))], loop: menuItems.count) { index in
                return PadingLabel(.text(menuItems[index]),
                                   .background(UIColor.orange.withAlphaComponent(0.7)),
                                   .cornerRadius(8))
            }, Content(PadingLabel(.text("Learning Goals"),
                                   .padding([.all(8)]),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 16)))
            ),ForEach(attributes: [.column(3), .size(.auto)], loop: scoreTitleItems.count) {
                return PadingLabel(.padding([.all(0)]),
                                   .text(scoreTitleItems[$0]),
                                   .font(UIFont.boldSystemFont(ofSize: 14)),
                                   .textColor(.black),
                                   .background(.clear),
                                   .textAlignment(.center))
            }, ForEach(attributes: [.column(3), .size(.size(80, 80))], loop: scoreItems.count) {
                return PadingLabel(.padding([.all(0)]),
                                   .text(scoreItems[$0]),
                                   .font(UIFont.boldSystemFont(ofSize: 24)),
                                   .textColor(.orange),
                                   .cornerRadius(16),
                                   .background(UIColor.lightGray.withAlphaComponent(0.3)),
                                   .textAlignment(.center))
            },Content(PadingLabel(.text("Your Daily Shedules Learning"),
                                  .padding([.all(8)]),
                                  .background(.clear),
                                  .textColor(.black),
                                  .textAlignment(.left),
                                  .font(UIFont.systemFont(ofSize: 16)))
            ), ForEach(attributes: [.column(1), .size(.auto)], loop: sheduleItems.count) {
                return PadingLabel(.padding([.all(16)]),
                                   .text(sheduleItems[$0]),
                                   .font(UIFont.systemFont(ofSize: 14)),
                                   .textAlignment(.left))
            }, Content(PadingLabel(.text("Level Focus - Level 6"),
                                   .padding([.all(8)]),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 16)))
            ), ForEach(attributes: [.column(2), .size(.auto)], loop: levelFocusItems.count) {
                return PadingLabel(.text(levelFocusItems[$0]),
                                   .padding([.all(8)]))
            }, Content(PadingLabel(.text("Practice"),
                                   .padding([.all(8)]),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 16)))
            ), ForEach(attributes: [.column(2), .size(.square)], loop: practiceItems.count) {
                return PadingLabel(.text(practiceItems[$0]),
                                   .padding([.all(8)]))
            }, Content(PadingLabel(.text("Sentence Practice Daily"),
                                   .padding([.all(8)]),
                                   .background(.clear),
                                   .textColor(.black),
                                   .textAlignment(.left),
                                   .font(UIFont.systemFont(ofSize: 16)))
            ), ForEach(attributes: [.size(.auto)], loop: sentencePracticeDailyItems.count) {
                return PadingLabel(.text(sentencePracticeDailyItems[$0]),
                                   .textAlignment(.left),
                                   .padding([.all(10)]),
                                   .background(UIColor.lightGray.withAlphaComponent(0.4)),
                                   .textColor(.black))
            }
        )
        
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.girdView.render(
                Content(PadingLabel(.text("Practice"),
                                    .padding([.all(8)]),
                                    .background(.clear),
                                    .textColor(.black),
                                    .textAlignment(.left),
                                    .font(UIFont.systemFont(ofSize: 16)))
                ), ForEach(attributes: [.column(5), .size(.square)], loop: self.practiceItems.count) {
                    return PadingLabel(.text(self.practiceItems[$0]),
                                       .padding([.all(8)]))
                }
            )
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.3) {
            self.girdView.render(
                Content(PadingLabel(.text("Practice"),
                                    .padding([.all(8)]),
                                    .background(.clear),
                                    .textColor(.black),
                                    .textAlignment(.left),
                                    .font(UIFont.systemFont(ofSize: 16)))
                ), ForEach(attributes: [.column(3), .size(.square)], loop: self.practiceItems.count) {
                    return PadingLabel(.text(self.practiceItems[$0]),
                                       .padding([.all(8)]))
                }
            )
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.6) {
            self.girdView.render(
                Content(PadingLabel(.text("Practice"),
                                    .padding([.all(8)]),
                                    .background(.clear),
                                    .textColor(.black),
                                    .textAlignment(.left),
                                    .font(UIFont.systemFont(ofSize: 16)))
                ), ForEach(attributes: [.column(4), .size(.square)], loop: self.practiceItems.count) {
                    return PadingLabel(.text(self.practiceItems[$0]),
                                       .padding([.all(8)]))
                }
            )
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.9) {
            self.girdView.render(
                Content(PadingLabel(.text("Practice"),
                                    .padding([.all(8)]),
                                    .background(.clear),
                                    .textColor(.black),
                                    .textAlignment(.left),
                                    .font(UIFont.systemFont(ofSize: 16)))
                ), ForEach(attributes: [.column(2), .size(.square)], loop: self.practiceItems.count) {
                    return PadingLabel(.text(self.practiceItems[$0]),
                                       .padding([.all(8)]))
                }
            )
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.2) {
            self.girdView.render(
                Content(PadingLabel(.text("Practice"),
                                    .padding([.all(8)]),
                                    .background(.clear),
                                    .textColor(.black),
                                    .textAlignment(.left),
                                    .font(UIFont.systemFont(ofSize: 16)))
                ), ForEach(attributes: [.column(4), .size(.square)], loop: self.practiceItems.count) {
                    return PadingLabel(.text(self.practiceItems[$0]),
                                       .padding([.all(8)]))
                }
            )
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.6) {
            self.girdView.render(
                Content(PadingLabel(.text("Practice"),
                                    .padding([.all(8)]),
                                    .background(.clear),
                                    .textColor(.black),
                                    .textAlignment(.left),
                                    .font(UIFont.systemFont(ofSize: 16)))
                ), ForEach(attributes: [.column(6), .size(.square)], loop: self.practiceItems.count) {
                    return PadingLabel(.text(self.practiceItems[$0]),
                                       .padding([.all(8)]))
                }
            )
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            (1...130).forEach { (i) in
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i/10)) {
                    self.girdView.render(
                        Content(PadingLabel(.text("Practice"),
                                            .padding([.all(8)]),
                                            .background(.clear),
                                            .textColor(.black),
                                            .textAlignment(.left),
                                            .font(UIFont.systemFont(ofSize: 16)))
                        ), ForEach(attributes: [.column(i), .size(.square)], loop: self.practiceItems.count) {
                            return PadingLabel(.text(self.practiceItems[$0]),
                                               .padding([.all(1)]))
                        }
                    )
                }
            }
        }
        
    }
    
}

