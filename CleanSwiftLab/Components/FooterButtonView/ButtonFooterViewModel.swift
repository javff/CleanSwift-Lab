//
//  ButtonViewModel.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/8/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

struct ButtonFooterViewModel: Codable {
    let buttons: [ButtonViewModel]
}

struct ButtonViewModel: Codable{
    let text: String
}

