//
//  View.swift
//  Grid
//
//  Created by Cao Phuoc Thanh on 20/01/2021.
//  Copyright © 2021 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import UIGridView

class View: Grid {
    
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
            Content(
                PadingLabel(
                    .text("Practice")
                ),
                size: .fit(50)
            ),
//            List(
//                cell: ViewCell.self,
//                items: self.viewModel.practiceItems
//            ) { (cell, item) -> ViewCell in
//                return cell
//            },
            ForEach(
                attributes: [
                    .column(Int.random(in: 1...2)),
                    .size(.auto)
                ],
                items: self.viewModel.practiceItems) { (item) -> UIView in
                return PadingLabel(
                    .font(UIFont.boldSystemFont(ofSize: 16)),
                    .background(UIColor.random),
                    .text(item),
                    .cornerRadius(2)
                )
            }
        )
    }
    
}
