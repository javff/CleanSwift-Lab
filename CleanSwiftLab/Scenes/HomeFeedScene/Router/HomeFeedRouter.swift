//
//  HomeFeedRouter.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/9/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

protocol HomeFeedRouterProtocol: class {
    func navigateToHero(heroPreview: HeroPreviewViewModel)
    func navigateToBrand(brandId: String)
}

protocol HeroDataPassing: class {
    var heroId: String {get set}
}


class HomeFeedRouter: HomeFeedRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func navigateToHero(heroPreview: HeroPreviewViewModel) {
        let destination = HeroCreator(heroId: heroPreview.id).configure()
        
        viewController?
            .navigationController?
            .pushViewController(destination, animated: true)
    }
    
    func navigateToBrand(brandId: String) {

    }
    
}
