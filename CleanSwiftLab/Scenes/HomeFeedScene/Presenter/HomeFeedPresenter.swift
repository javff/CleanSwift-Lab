//
//  HomeFeedPresenter.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/5/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

protocol HomeFeedPresenterProtocol: class{
    func showFeed(items:[HomeFeedEntity])
    func showError(error: Error)
}

class HomeFeedPresenter: NSObject, HomeFeedPresenterProtocol {
    
    weak var viewController: HomeViewDisplayLogic?
    let componentFactoryModel: ComponentFactoryModelProtocol
    
    init(componentFactoryModel: ComponentFactoryModelProtocol = ComponentFactoryModel()) {
        self.componentFactoryModel = componentFactoryModel
        super.init()
    }
    
    func showFeed(items: [HomeFeedEntity]) {
        let components = items.map{transform($0)}
        viewController?.displayHome(components: components)
    }
    
    func showError(error: Error) {
        
    }
    
    private func transform(_ homeFeedEntity: HomeFeedEntity) -> ComponentsCoreViewModelType{
        
        guard let data = homeFeedEntity.data.data(using: .utf8) else{
            return .unknown
        }
        
        return componentFactoryModel.createModel(type: homeFeedEntity.type, data: data)
    }
}


