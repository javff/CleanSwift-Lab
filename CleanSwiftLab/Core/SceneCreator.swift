//
//  SceneRouterProtocol.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/12/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

protocol SceneCreatorProtocol: class {
    func configure() -> UIViewController
}
