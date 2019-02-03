//
//  ViewController.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 02/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repository = DogRepository()
        _ = repository.getAll().subscribe(onNext: { value in
            print(value.count)
        })
    }
}

