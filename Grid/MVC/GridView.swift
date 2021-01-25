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
                .interitemSpacing(1),
                .lineSpacing(1),
            ],
            Label(
                .text("KJSHFLKJSFH:SFJKHLSFKJHSLF"),
                .background(.red)
            ),
//            Image(
//                .contentMode(.scaleAspectFit),
//                .image(UIImage(named: "HomeFolderIcon")!)
//            ),
            List(
                attributes: [
                    .column(Int.random(in: 1...3)),
                    .size(.auto)
                ],
                items: ["SFSF", "JHSFGJSFGJ"]) { (item, view) -> Grid.View.Label in
                view.text = item
                return view
            },
//            List(
//                attributes: [
//                    .column(Int.random(in: 2...5)),
//                    .size(.auto)
//                ],
//                items: self.viewModel.images) { (item, view)  -> Grid.View.Image  in
//                view.render(
//                    .background(.lightGray),
//                    .image(item),
//                    .contentMode(.scaleAspectFit)
//                )
//                return view
//            },
            List(
                attributes: [
                    .column(Int.random(in: 1...2)),
                    .size(.auto)
                ],
                items: self.viewModel.practiceItems) { (item, view)  -> Grid.View.Label  in
                view.backgroundColor = .lightGray
                view.text = "\(item)"
                return view
            }
        )
    }
    
}
