//
//  View.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 20/01/2021.
//  Copyright © 2021 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import UIGridView

class GridView: Grid {
    
    var viewModel: ViewModel
    
    required init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func randoom() {
        self.render(
            attributes: [
                .interitemSpacing(2),
                .lineSpacing(2),
            ],
            ForEach(attributes: [.column(3), .size(.fit(Float.random(in: 50...200)))], items: self.viewModel.number) { content in
                cell.text = "\(item)"
                return content
            }
        )
    }
    
}
