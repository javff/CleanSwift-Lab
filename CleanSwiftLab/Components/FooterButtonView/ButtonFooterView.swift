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
    
    
    public func bindView(buttons: [ButtonViewModel]) {
        for buttonModel in buttons {
            let button = createButton(with: buttonModel.text)
            containerStackView.addArrangedSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
        }
    }
    
    private func createButton(with text: String) -> UIButton{
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor(red:0.00, green:0.41, blue:0.98, alpha:1.0), for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.backgroundColor = UIColor.groupTableViewBackground
        return button
    }
}
