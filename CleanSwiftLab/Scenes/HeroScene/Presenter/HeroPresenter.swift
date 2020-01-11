//
//  HeroPresenter.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/9/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

protocol HeroPresenterProtocol: class {
    func showHero(heroEntity: HeroEntity)
    func changeHeroLayout(state: SceneState)
    func closeView()
    func showError(error: Error)
}


class HeroPresenter: HeroPresenterProtocol {

    weak var viewController: HeroViewDisplayLogic?
    
    
    func showHero(heroEntity: HeroEntity) {
        let viewModel = HeroViewModel.init(id: heroEntity.id,
                                           imageName: heroEntity.fullImageName,
                                           hexColor: heroEntity.backgroundHeroHexColor,
                                           heroName: heroEntity.heroName,
                                           realName: heroEntity.realName,
                                           description: heroEntity.description)
        viewController?.displayHero(viewModel: viewModel)
    }
    
    func changeHeroLayout(state: SceneState) {
        viewController?.renderState(state: state)
    }
    
    func closeView() {
        viewController?.router?.goToBack()
    }
    
    func showError(error: Error) {
        
    }
}
