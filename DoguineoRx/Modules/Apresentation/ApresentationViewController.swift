//
//  ViewController.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 02/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit
import AutoLayouty
import RxSwift

protocol ApresentationDelegate: class {
    func navigateToDraw()
}

class ApresentationViewController: UIViewController {
    
    weak var delegate: ApresentationDelegate?
    
    let autolayout = AutoLayouty()
    var repository: DogRepository!
    var tableView: UITableView!
    var viewModel: ApresentationViewModel!

    let disposeBag = DisposeBag()
    
    init(repository: DogRepository) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.setupNavigationBar()
        self.setupViewModel()
        self.setupTableView()
        self.setupBindings()
    }
    
    fileprivate func setupNavigationBar() {
        if let _ = self.navigationController {
            self.navigationItem.title = "🐶"
        }
    }
    
    fileprivate func setupViewModel() {
        self.viewModel = ApresentationViewModel(repository: self.repository)
    }
    
    fileprivate func setupTableView() {
        tableView = UITableView(frame: .zero)
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.allowsSelection = false
        tableView.registerCell("DogTableViewCell")
        self.view.addSubview(tableView)
        autolayout.setEqualCentralSize(to: tableView, from: self.view)
    }
}

extension ApresentationViewController {
    
    func setupBindings() {
        self.viewModel.dataSource
            .bind(to: tableView.rx
                .items(cellIdentifier: "DogTableViewCell",
                       cellType: DogTableViewCell.self))
            {  row, element, cell in
                cell.initCell(with: element)
            }
            .disposed(by: disposeBag)
    }
}
