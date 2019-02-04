//
//  Repository.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import RxSwift
import Moya

protocol Repository: class {
    func getAll() -> Single<[Dog]>
    func byBreed(_ breed: String) -> Single<[Dog]>
}

struct DogError: LocalizedError {
    let message: String
    
    init(message: String = "Who let the dogs out???") {
        self.message = message
    }
    
    var errorDescription: String? {
        return self.message
    }
}
