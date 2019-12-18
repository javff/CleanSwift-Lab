//
//  HeroEntity.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/9/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation


struct HeroEntity: Codable {
    let id: String
    let description: String
    let realName: String
    let heroName: String
    let firstComicYear: Int
    let fullImageName: String
    let backgroundHeroHexColor: String
}
