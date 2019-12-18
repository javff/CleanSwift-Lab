//
//  HeroRouter.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/9/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

protocol HeroRouterProtocol: class {
    func goToBack()
}



class HeroRouter: NSObject, HeroRouterProtocol {
    
    weak var viewController: UIViewController?

    init(viewController: UIViewController){
        self.viewController = viewController
        super.init()
    }
    
    func goToBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    
}
