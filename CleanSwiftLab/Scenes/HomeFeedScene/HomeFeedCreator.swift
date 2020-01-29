//
//  HomeFeedWireFrame.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/6/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit
 
class HomeFeedCreator:NSObject, SceneCreatorProtocol {
    
    let homeContainer = DIContainer()
    
    override init() {
        super.init()
            
        homeContainer
           
            .register(HomeFeedRouter.self, instance: HomeFeedRouter())
            
            .register(HeroPreviewRouterProtocol.self, { (resolver) in
                return resolver.resolve(HomeFeedRouter.self)
            })
            
            .register(HomeFeedPresenter.self, instance: HomeFeedPresenter())
            
            .register(HomeFeedInteractor.self, instance: HomeFeedInteractor())
            
            .register(DIContainer.self, instance: homeContainer)
        
            .register(HomeFeedViewController.self, { (resolver) in
                let componentFactoryView = ComponentFactoryView(container: resolver.resolve(DIContainer.self))
                let controller = HomeFeedViewController(componentFactoryView: componentFactoryView)
                let interactor = resolver.resolve(HomeFeedInteractor.self)
                let presenter = resolver.resolve(HomeFeedPresenter.self)
                let router = resolver.resolve(HomeFeedRouter.self)

                router.viewController = controller
                controller.interactor = interactor
                interactor.presenter = presenter
                controller.router = router
                controller.interactor = interactor
                presenter.viewController = controller
                return controller
            })
        
    }
  
    func configure() -> UIViewController {
        return homeContainer.resolve(HomeFeedViewController.self)
    }
    
}
