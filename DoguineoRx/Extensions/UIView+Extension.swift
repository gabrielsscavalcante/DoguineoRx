//
//  UIView+Extension.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit

extension UIView {
    
    func round() {
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
    }
}
