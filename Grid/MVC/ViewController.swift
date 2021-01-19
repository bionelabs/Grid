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
    
    var girdView: View = View(viewModel: ViewModel())
    
    @objc func leftBarButtonItemDidTap() {
        self.girdView.randoom()
    }
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.leftBarButtonItem =  UIBarButtonItem(
            title: "Randoom",
            style: .done,
            target: self,
            action: #selector(leftBarButtonItemDidTap)
        )
        
        self.view = girdView
        self.girdView.randoom()
    }
    
}

