//
//  String+Extension.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import Foundation

extension String {
    
    var breed: String {
        return self.components(separatedBy: "/")[4]
    }
}
