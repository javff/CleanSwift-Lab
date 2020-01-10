//
//  CarruselConfigurator.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 1/3/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

struct CarruselViewConfigurator<Model>: ComponentConfiguratorProtocol {
    
    

    typealias ComponentModel = Model
    typealias ComponentView = CarruselView
    typealias ComponentViewDelegate = CarruselViewDelegate
    
    let images: KeyPath<Model, [CarruselItemViewModel]>
    
    func configure(_ view: CarruselView,
                   for model: Model,
                   and handlerEvents: CarruselViewDelegate? = nil) {
        
        view.updateImages(imagesModel:  model[keyPath: images])
        view.delegate = handlerEvents
    }
    
}
