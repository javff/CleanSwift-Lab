//
//  ComponentFactoryModel.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/23/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

protocol ComponentFactoryModelProtocol: class {
    func createModel(type: String, data: Data) -> ComponentsCoreViewModelType
}


class ComponentFactoryModel: NSObject, ComponentFactoryModelProtocol {
    
    func createModel(type: String, data: Data) -> ComponentsCoreViewModelType {
        
        let decoder = JSONDecoder()

        if let viewModel = try? decoder.decode(CarruselViewModel.self, from: data) {
            return .carrusel(data: viewModel)
        }
        
        if let viewModel = try? decoder.decode(TitleViewModel.self, from: data) {
            return .title(data: viewModel)
        }
        
        if let viewModel = try? decoder.decode(HeroPreviewViewModel.self, from: data) {
            return .heroPreview(data: viewModel)
        }
        
        if let viewModel = try? decoder.decode(ButtonFooterViewModel.self, from: data) {
            return .footerButton(data: viewModel)
        }
        
       return .unknown
    }

}
