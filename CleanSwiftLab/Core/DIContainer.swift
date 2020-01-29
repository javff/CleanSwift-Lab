//
//  DIContainer.swift
//  CleanSwiftLab
//
//  Created by Juan Andres Vasquez Ferrer on 1/29/20.
//  Copyright © 2020 Juan Andres Vasquez Ferrer. All rights reserved.
//

import Foundation

// MARK: - Implementacion de Dependecy Injection Container //

protocol Resolver {
    func resolve<DepndencyType>(_ type: DepndencyType.Type) -> DepndencyType
}

protocol DIFactory {
    associatedtype DependecyType
    func resolve(_ resolver: Resolver) -> DependecyType
}

extension DIFactory {
    func supports<T>(_ type: T.Type) -> Bool {
        return type == DependecyType.self
    }
}

final class AnyDIFactory {
    
    private let _resolve: (Resolver) -> Any
    private let _supports: (Any.Type) -> Bool
    
    init<T: DIFactory>(_ diFactory: T) {
        self._resolve = { resolver -> Any in
            diFactory.resolve(resolver)
        }
        self._supports = { $0 == T.DependecyType.self }
    }
    
    func resolve<DepndencyType>(_ resolver: Resolver) -> DepndencyType {
        return _resolve(resolver) as! DepndencyType
    }
    
    func supports<DepndencyType>(_ type: DepndencyType.Type) -> Bool {
        return _supports(type)
    }
}


struct DependecyInjectionFactory<DependecyType>: DIFactory {
    
    private let factory: (Resolver) -> DependecyType

    init(_ type: DependecyType.Type, factory: @escaping (Resolver) -> DependecyType) {
        self.factory = factory
    }

    func resolve(_ resolver: Resolver) -> DependecyType {
        return factory(resolver)
    }
}


class DIContainer: Resolver {
    
    var factories: [AnyDIFactory] = []
    
    // MARK: Register
    @discardableResult
    func register<T>(_ interface: T.Type, instance: T) -> DIContainer {
        return register(interface) { _ in instance }
    }

    @discardableResult
    func register<DepndencyType>(_ type: DepndencyType.Type, _ factory: @escaping (Resolver) -> DepndencyType) -> DIContainer {
        
        assert(!factories.contains {$0.supports(type)})

        let newFactory = DependecyInjectionFactory<DepndencyType>(type, factory: { resolver in
            factory(resolver)
        })
        self.factories = factories + [AnyDIFactory(newFactory)]
        return self
    }

    // MARK: Resolver

    func resolve<DepndencyType>(_ type: DepndencyType.Type) -> DepndencyType {
        guard let factory = factories.first(where: { $0.supports(type) }) else {
            fatalError("No suitable factory found")
        }
        return factory.resolve(self)
    }

    func factory<ServiceType>(for type: ServiceType.Type) -> () -> ServiceType {
        guard let factory = factories.first(where: { $0.supports(type) }) else {
            fatalError("No suitable factory found")
        }

        return { factory.resolve(self) }
    }
}
