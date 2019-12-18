//
//  CarruselViewModel.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/6/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

struct CarruselViewModel: Codable {
    let items: [CarruselItemViewModel]
}

struct CarruselItemViewModel: Codable{
    let id: String
    let imageName:String
}
