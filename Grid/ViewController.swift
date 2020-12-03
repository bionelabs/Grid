//
//  ViewController.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import UIGridView

class Loabel: Grid.Label {
    
    required init(_ variables: Grid.Variable...) {
        super.init(variables)
    }
    
    required init(_ variables: [Grid.Variable]) {
        super.init(variables)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ViewController: UIViewController {
    
    var _view: Grid!
    
    let button: Grid.Button = Grid.Button(.color(.orange), .title("Random Color"), .masksToBounds(true), .cornerRadius(50), .height(250))
    
    let header: Loabel = Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(50))
    
    let bael1: Loabel = Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350)))
    let bael2: Loabel = Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350)))
    let bael3: Loabel = Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350)))
    let bael4: Loabel = Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350)))
    let bael5: Loabel = Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350)))
    let bael6: Loabel = Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350)))
    
    func buttonDidPress() {
        print("asjkdalksjgflkjahsf")
        
        header.set(.color(.random))
        
        self.bael1.set(.color(.random))
        self.bael2.set(.color(.random))
        self.bael3.set(.color(.random))
        self.bael4.set(.color(.random))
        self.bael5.set(.color(.random))
        self.bael6.set(.color(.random))
    }
    
    override func loadView() {
        super.loadView()
        
        button.tap(self.buttonDidPress)
        
        self._view = Grid(
            View(header),
            Group(tracks: 3,
                  button,
                  bael1,
                  bael2,
                  bael3,
                  bael4,
                  bael5,
                  bael6
            ),
            Group(tracks: 3,
                  Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350))),
                  Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350))),
                  Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350))),
                  Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350))),
                  Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350))),
                  Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350))),
                  Loabel(.color(.random), .title("2"), .textAlignment(.center), .height(Float.random(in: 50...350)))
            )
        )
        
        self.view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

