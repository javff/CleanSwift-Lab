//
//  ComponentConfigurator.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 1/2/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

public protocol ComponentConfiguratorProtocol {
    
    associatedtype ComponentModel
    associatedtype ComponentView: UIView
    associatedtype HandlerActions
    
    func configure(_ view: ComponentView,
                   for model: ComponentModel,
                   and actions:HandlerActions?)
}
