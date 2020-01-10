//
//  PreViewHandlerActions.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 1/8/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

public class PreviewHandlerAction: NSObject, HandlerActionProtocol {
    
    let viewModel: HeroPreviewViewModel
    let router: HomeFeedRouterProtocol?
    
    init(viewModel:HeroPreviewViewModel, router: HomeFeedRouterProtocol?) {
        self.viewModel = viewModel
        self.router = router
        super.init()
    }
    
    public lazy var handlerTapAction: () -> Void = {
        self.router?.navigateToHero(heroPreview: self.viewModel)
    }
}
