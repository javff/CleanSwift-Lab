//
//  KeyPathExtension.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 1/3/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation


extension Sequence {
    func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
        return self.map {
            $0[keyPath: keyPath]
        }
    }
    
    func flatMap<T>(_ keyPath: KeyPath<Element, T?>) -> [T] {
        return self.compactMap {
            $0[keyPath: keyPath]
        }
    }
}
