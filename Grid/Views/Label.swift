//
//  Label.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 12/8/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit

class AppLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.random
        self.textColor = UIColor.white
        self.font = UIFont.boldSystemFont(ofSize: 16)
        self.textAlignment = .center
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 0
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
