//
//  ComponentCoreViewModel.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/23/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation
import UIKit

protocol ComponentFactoryViewProtocol: class {
    func createComponent(with viewModel: ComponentsCoreViewModelType,
                         and router: ComponentsRouterProtocol?) -> UIView?
}

class ComponentFactoryView: NSObject, ComponentFactoryViewProtocol {
   
    func createComponent(with viewModel: ComponentsCoreViewModelType,
                         and router: ComponentsRouterProtocol?) -> UIView? {
        
        switch viewModel {
            
        case let .carrusel(viewModel):
            let carruselView = CarruselView()
            let configurator = CarruselViewConfigurator<CarruselViewModel>(
                images: \.items
            )
            configurator.configure(carruselView, for: viewModel)
            return carruselView
            
        case let .title(viewModel):
            let titleView = TitleView(viewModel: viewModel)
            return titleView
            
        case let .heroPreview(viewModel):
            let configurator = HeroPreviewConfigurator<HeroPreviewViewModel>(
                imageName: \.imageName,
                content: \.content,
                title: \.title
            )
            
            let handlerAction = PreviewHandlerAction(
                viewModel: viewModel,
                router: router
            )
            
            let heroPreview = HeroPreviewView(handlerActions: handlerAction)
            configurator.configure(heroPreview, for: viewModel)
            return heroPreview
            
        case let .footerButton(viewModel):
            let configurator = FooterButtonConfigurator<ButtonFooterViewModel>(
                buttonsKeyPath: \.buttons
            )
            let footerButton = ButtonFooterView()
            configurator.configure(footerButton, for: viewModel)
            return footerButton
            
        case .unknown:
            return nil
        }
    }
}
