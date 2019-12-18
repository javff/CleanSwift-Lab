//
//  ResultEnum.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 12/6/19.
//  Copyright © 2019 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

enum Results<T>{
    case success(response: T)
    case error(error: Error)
}


