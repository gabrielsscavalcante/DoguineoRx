//
//  NetworkAdapter.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import Foundation
import Moya
import RxSwift

struct DogService: Service {
    
    let provider: MoyaProvider<DogRouter>
    static let bag = DisposeBag()
    
    init(provider: MoyaProvider<DogRouter>) {
        self.provider = provider
    }
    
    func random() -> Single<Response> {
        return self.provider.rx.request(.random)
    }
    
    func byBreed(_ breed: String) -> Single<Response> {
        return self.provider.rx.request(.byBreed(breed))
    }
}
