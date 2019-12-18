//
//  ComponentViewModel.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/6/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

enum ComponentsCoreViewModelType{
   
    case carrusel(data: CarruselViewModel)
    case title(data: TitleViewModel)
    case heroPreview(data: HeroPreviewViewModel)
    case footerButton(data: ButtonFooterViewModel)
    case unknown
    
    init(type: String, data: String) {
        
        let decoder = JSONDecoder()
        guard let data = data.data(using: .utf8) else {
            self = .unknown
            return
        }
        
        if let viewModel = try? decoder.decode(CarruselViewModel.self, from: data) {
            self = .carrusel(data: viewModel)
            return
        }
        
        if let viewModel = try? decoder.decode(TitleViewModel.self, from: data) {
            self = .title(data: viewModel)
            return
        }
        
        if let viewModel = try? decoder.decode(HeroPreviewViewModel.self, from: data) {
            self =  .heroPreview(data: viewModel)
            return
        }
        
        if let viewModel = try? decoder.decode(ButtonFooterViewModel.self, from: data) {
            self = .footerButton(data: viewModel)
            return
        }
        
        self = .unknown
    }
}


