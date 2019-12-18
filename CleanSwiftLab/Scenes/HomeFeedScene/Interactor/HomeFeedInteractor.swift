//
//  HomeFeedInteractor.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/5/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

protocol HomeFeedInteractorProtocol: class {
    func getFeed()
}

protocol HomeFeedStoreProtocol: class {
    var homeFeedEntities: [HomeFeedEntity] {get set}
}

class HomeFeedInteractor: NSObject, HomeFeedInteractorProtocol, HomeFeedStoreProtocol{
    
    let worker: HomeFeedWorkerProtocol
    var presenter: HomeFeedPresenterProtocol?
    var homeFeedEntities: [HomeFeedEntity] = []
    
    init(worker: HomeFeedWorkerProtocol = FakeHomeFeedWorker()){
        self.worker = worker
        super.init()
    }
    
    func getFeed() {
        
        worker.getHomeFeed {[weak self] (response) in
           
            guard let strongSelf = self else{
                return
            }
            
            switch response{
            case let .success(data):
                strongSelf.homeFeedEntities = data
                strongSelf.presenter?.showFeed(items: data)
            case let .error(error):
                strongSelf.presenter?.showError(error: error)
            }
        }
    }
}
