//
//  DefaultContainter.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import Foundation
import Swinject
import Moya

final class DefaultContainer {
    
    let container: Container
    
    init() {
        self.container = Container()
        self.registerServices()
        self.registerViews()
    }
}

//Register Views
extension DefaultContainer {
    
    func registerViews() {
        
        self.container.register(ApresentationViewController.self) { resolver in
            ApresentationViewController(repository: resolver.resolve(DogRepository.self)!)
        }
        
        self.container.register(DrawViewController.self) { _ in
            DrawViewController()
        }
    }
}

//Register Services
extension DefaultContainer {
    
    func registerServices() {
        self.container.register(DogService.self) { _ in
            let provider = MoyaProvider<DogRouter>(plugins: self.getDefaultPlugins())
            return DogService(provider: provider)
        }
        
        self.container.register(DogRepository.self) { resolver in
            DogRepository(
                service: resolver.resolve(DogService.self)!
            )
        }
    }
    
    func getDefaultPlugins() -> [PluginType] {
        #if DEBUG
        return [NetworkLoggerPlugin(verbose: true)]
        #else
        return []
        #endif
    }
}
