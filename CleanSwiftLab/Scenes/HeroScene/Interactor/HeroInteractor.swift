//
//  HeroInteractor.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/9/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

protocol HeroInteractorProtocol: class {
    func getHero()
}

protocol HeroStoreProtocol: class {
    var heroId: String {get set}
}

class HeroInteractor:NSObject, HeroInteractorProtocol, HeroStoreProtocol {
    
    var heroId: String
    var presenter: HeroPresenterProtocol?
    let worker: HeroWorkerProtocol
    
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
}
