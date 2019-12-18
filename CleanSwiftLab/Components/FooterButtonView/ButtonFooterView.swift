//
//  ButtonView.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/8/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

class ButtonFooterView: BaseView {
    
    @IBOutlet weak var containerStackView: UIStackView!
    
    let viewModel:ButtonFooterViewModel
    
    init(frame: CGRect = .zero, viewModel: ButtonFooterViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        for buttonViewModel in viewModel.buttons {
            let button = createButton(with: buttonViewModel.text)
            containerStackView.addArrangedSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
    }
    
    private func createButton(with text: String) -> UIButton{
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor(red:0.00, green:0.41, blue:0.98, alpha:1.0), for: .normal)
        button.backgroundColor = UIColor.groupTableViewBackground
        return button
    }
}
