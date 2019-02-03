//
//  DogApi.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import Foundation
import Moya

public enum DogApi {
    case random
    case byBreed(_ breed: String)
}

extension DogApi: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://dog.ceo/api")!
    }
    
    public var path: String {
        switch self {
        case .byBreed(let breed):
            return "/breed/\(breed)/images/random"
        case .random:
            return "/breeds/image/random/20"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .byBreed(_), .random:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain // TODO
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
