//
//  UITableView+Extension.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell(_ identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil),
                      forCellReuseIdentifier: identifier)
    }
}
