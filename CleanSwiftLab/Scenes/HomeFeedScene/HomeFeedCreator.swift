//
//  HomeFeedWireFrame.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/6/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

class HomeFeedCreator: SceneCreatorProtocol{
  
    func configure() -> UIViewController {
        let interactor = HomeFeedInteractor()
        let presenter = HomeFeedPresenter()
        let viewController = HomeFeedViewController()
        let router = HomeFeedRouter()
        
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
