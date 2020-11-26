//
//  ViewController.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 11/26/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let _view: GridView = {
        let view = GridView({
            let view = UIView()
            view.backgroundColor = .red
            return view
        }(),{
            let view = UIView()
            view.backgroundColor = .orange
            return view
        }(),{
            let view = UIView()
            view.backgroundColor = .blue
            return view
        }(),{
            let view = UIView()
            view.backgroundColor = .green
            return view
        }(),{
            let view = UIView()
            view.backgroundColor = .purple
            return view
        }(), tracks: 2)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

