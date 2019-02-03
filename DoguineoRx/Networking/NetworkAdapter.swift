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

struct NetworkAdapter {
    
    static let provider = MoyaProvider<DogApi>()
    static let bag = DisposeBag()
    
    static func request(
        target: DogApi,
        success successCallback: @escaping (Response) -> Void,
        error errorCallback: @escaping (Error) -> Void
        ) {
        
        provider.rx.request(target).subscribe { (event) in
            switch event {
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    successCallback(response)
                } else {
                    let error = NSError(domain:"com.vsemenchenko.networkLayer",
                                        code:0,
                                        userInfo:[NSLocalizedDescriptionKey: "Parsing Error"])
                    errorCallback(error)
                }
            case .error(let error):
                errorCallback(error)
            }
        }.disposed(by: bag)
    }
}
