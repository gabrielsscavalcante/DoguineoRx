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

class DogRepository {
    
    func getAll() -> Observable<[Dog]> {
        return Observable.create { observer in
            NetworkAdapter.request(target: .random, success: { response in
                do {
                    let data = try JSONSerialization.jsonObject(with: response.data, options: [])
                    
                    if let json = data as? [String: Any], let imagesUrl = json["message"] as? [String] {
                        observer.onNext(imagesUrl.map {
                            var dog = Dog()
                            dog.imageUrl = $0
                            return dog
                        })
                        observer.onCompleted()
                    } else {
                        observer.onNext([])
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(error)
                }
            }, error: { error in
                print(error)
                observer.onError(error)
            })
            
            return Disposables.create()
        }.debug()
    }
}
