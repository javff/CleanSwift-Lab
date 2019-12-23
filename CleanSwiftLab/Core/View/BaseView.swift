//
//  BaseViewController.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/5/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNib()
    }
    
    private func setupNib(){
       
        let className = String(describing: type(of: self))
        let nib = UINib(nibName: className, bundle: nil)
        
        guard let nibView = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else{
            return
        }
        
        addSubview(nibView)
        nibView.translatesAutoresizingMaskIntoConstraints = false
        nibView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nibView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nibView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nibView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
