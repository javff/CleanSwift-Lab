//
//  FooterButtonConfigurator.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 1/2/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

struct FooterButtonConfigurator<Model>: ComponentConfiguratorProtocol {
    
    typealias ComponentModel = Model
    typealias ComponentView = ButtonFooterView
    typealias ComponentViewDelegate = Any

    let buttonsKeyPath: KeyPath<Model, [ButtonViewModel]>
    
    func configure(_ view: ButtonFooterView, for model: Model, and viewDelegate: Any? = nil) {
        let buttons = model[keyPath: buttonsKeyPath]
        view.bindView(buttons: buttons)
    }
    
}
