//
//  Response.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import Foundation

struct DogResponse: Decodable {
    let status: String
    let message: [String]
}
