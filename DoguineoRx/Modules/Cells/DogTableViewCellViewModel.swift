//
//  DogTableViewCellViewModel.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 04/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DogTableViewCellViewModel {
    
    private let dog: PublishSubject<Dog>
    
    let breed: Driver<String>
    
    init() {
        
        self.dog = PublishSubject<Dog>()
        
        self.breed = self.dog
            .map { $0.breed }
            .asDriver(onErrorJustReturn: "")
    }
    
    func bind(_ dog: Dog) {
        self.dog.onNext(dog)
    }
}
