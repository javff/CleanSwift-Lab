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
    
    typealias ComponentFactoryDelegate = (CarruselViewDelegate & HeroPreviewViewDelegate)

    func createComponent(with viewModel: ComponentsCoreViewModelType, and delegate: ComponentFactoryDelegate) -> UIView?
}

class ComponentFactoryView: NSObject, ComponentFactoryViewProtocol {
   
    func createComponent(with viewModel: ComponentsCoreViewModelType,
                         and delegate: ComponentFactoryDelegate) -> UIView? {
        
        switch viewModel {
            
        case let .carrusel(viewModel):
            let carruselView = CarruselView(viewModel:viewModel)
            carruselView.delegate = delegate
            return carruselView
            
        case let .title(viewModel):
            let titleView = TitleView(viewModel: viewModel)
            return titleView
            
        case let .heroPreview(viewModel):
            let heroPreview = HeroPreviewView(viewModel: viewModel)
            heroPreview.delegate = delegate
            return heroPreview
            
        case let .footerButton(viewModel):
            let footerButton = ButtonFooterView(viewModel: viewModel)
            return footerButton
            
        case .unknown:
            return nil
        }
    }
}
