//
//  HeroPreviewConfigurator.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 1/2/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

struct HeroPreviewConfigurator<Model>: ComponentConfiguratorProtocol {
   
    typealias ComponentModel = Model
    typealias ComponentView = HeroPreviewView
    typealias HandlerActions = HandlerActionProtocol

    let imageName: KeyPath<Model, String?>
    let content: KeyPath<Model, String?>
    let title: KeyPath<Model, String?>

    func configure(_ view: HeroPreviewView,
                   for model: Model,
                   and viewDelegate: HandlerActionProtocol? = nil) {
        
        if let imageName = model[keyPath: imageName] {
            view.imageView.image = UIImage(named: imageName)
        }
        view.titleLabel.text = model[keyPath: title]
        view.descriptionLabel.text = model[keyPath: content]
    }

}
