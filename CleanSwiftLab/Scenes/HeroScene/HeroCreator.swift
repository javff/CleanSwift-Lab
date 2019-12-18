//
//  HeroWireFrame.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/9/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

class HeroCreator:NSObject, SceneCreatorProtocol, HeroDataPassing{
   
    var heroId: String
    
    init(heroId: String) {
        self.heroId = heroId
        super.init()
    }
    
     func configure() -> UIViewController {
        
        let interactor = HeroInteractor(heroId: heroId)
        let presenter = HeroPresenter()
        let viewController = HeroViewController()
        let router = HeroRouter(viewController: viewController)

        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }
}
