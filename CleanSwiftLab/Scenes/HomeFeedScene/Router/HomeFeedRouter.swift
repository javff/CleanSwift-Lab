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
    var viewController: UIViewController? {get set}
}

protocol HeroDataPassing: class {
    var heroId: String {get set}
}

typealias ComponentsRouterProtocol = (HeroPreviewRouterProtocol)


class HomeFeedRouter: HomeFeedRouterProtocol {
    weak var viewController: UIViewController?
}

extension HomeFeedRouter: ComponentsRouterProtocol {
    
    func navigateToHero(heroPreview: HeroPreviewViewModel) {
        let destination = HeroCreator(heroId: heroPreview.id).configure()
        
        viewController?
            .navigationController?
            .pushViewController(destination, animated: true)
    }
}
