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
    
}
