//
//  HeroViewModel.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/9/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

struct HeroViewModel: Codable {
    let id: String
    let imageName: String
    let hexColor: String
    let heroName: String
    let realName: String
    let description: String
}
