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
            Content(
                PadingLabel(
                    .text("Practice")
                ),
                size: .fit(50)
            ),
            ForEach(
                attributes: [
                    .column(Int.random(in: 1...5)),
                    .size(.fit(Float.random(in: 80...300)))
                ],
                items: self.viewModel.number) { (item) -> UIView in
                return PadingLabel(
                    .font(UIFont.boldSystemFont(ofSize: 16)),
                    .background(UIColor.random),
                    .text("\(item)"),
                    .cornerRadius(2)
                )
            },
            Content(
                PadingLabel(
                    .text("Practice")
                ),
                size: .fit(50)
            ),
            ForEach(
                attributes: [
                    .column(Int.random(in: 1...5)),
                    .size(.fit(Float.random(in: 80...300)))
                ],
                items: self.viewModel.number) { (item) -> UIView in
                return PadingLabel(
                    .font(UIFont.boldSystemFont(ofSize: 16)),
                    .background(UIColor.random),
                    .text("\(item)"),
                    .cornerRadius(2)
                )
            }
        )
    }
    
}