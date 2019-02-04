//
//  ApresentationViewModel.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import RxSwift
import RxCocoa

class ApresentationViewModel {
    
    private let privateDataSource: Variable<[Dog]> = Variable([])
    private let disposeBag = DisposeBag()
    
    public let dataSource: Observable<[Dog]>
    
    init(repository: DogRepository) {
        
        self.dataSource = privateDataSource.asObservable()
        
        _ = repository.getAll().subscribe { [weak self] event in
            switch event {
            case .success(let dogs):
                self?.privateDataSource.value = dogs
            case .error(_):
                print(DogError().message)
            }
        }
    }
}
