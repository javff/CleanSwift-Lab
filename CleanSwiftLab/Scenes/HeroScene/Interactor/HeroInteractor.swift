//
//  HeroInteractor.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/9/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

enum SceneState{
    case open
    case collapsed
}

protocol HeroInteractorProtocol: class {
    var state: SceneState {get}
    func getHero()
    func change(newState: SceneState)
}

protocol HeroStoreProtocol: class {
    var heroId: String {get set}
}

class HeroInteractor:NSObject, HeroInteractorProtocol, HeroStoreProtocol {
    
    var heroId: String
    var presenter: HeroPresenterProtocol?
    let worker: HeroWorkerProtocol
    var state: SceneState = .collapsed
    
    init(worker: HeroWorkerProtocol = HeroWorker(), heroId: String){
        self.heroId = heroId
        self.worker = worker
        super.init()
    }
    
    
    func getHero() {
        
        worker.getHero(heroId) {[weak self] (response) in
           
            guard let strongSelf = self else{
                return
            }
            
            switch response{
            case .success(response: let data):
                strongSelf.presenter?.showHero(heroEntity: data)
            case .error(error: let error):
                strongSelf.presenter?.showError(error: error)
            }
            
        }
    }
    
    func change(newState: SceneState) {
        
        if state == .collapsed && newState == .collapsed {
            self.presenter?.closeView()
        }
        
        // else change state //
        state = newState
        self.presenter?.changeHeroLayout(state: state)
    }
}
