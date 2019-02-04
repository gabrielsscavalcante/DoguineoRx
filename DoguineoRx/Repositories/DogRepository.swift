//
//  DogRepository.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class DogRepository: Repository {
    
    let service: DogService
    
    init(service: DogService) {
        self.service = service
    }
    
    func getAll() -> Single<[Dog]> {
        return self.service.random()
            .map(DogResponse.self)
            .map { $0.message.map { Dog(url: $0) }
        }
    }
    
    func byBreed(_ breed: String) -> Single<[Dog]> {
        return self.service.byBreed(breed)
            .map(DogResponse.self)
            .map { $0.message.map { Dog(url: $0) }
        }
    }
}
