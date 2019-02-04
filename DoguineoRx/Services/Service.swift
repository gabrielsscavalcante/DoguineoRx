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

protocol Service {
    func random()-> Single<Response>
    func byBreed(_ breed: String) -> Single<Response>
}
