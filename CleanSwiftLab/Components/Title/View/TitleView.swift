//
//  TitleView.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/8/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

class TitleView: BaseView{

    @IBOutlet weak var titleLabel: UILabel!
    
    let viewModel: TitleViewModel
    
    init(frame: CGRect = .zero, viewModel: TitleViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        titleLabel.text = viewModel.content
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(viewModel.fontSize))
    }
}
