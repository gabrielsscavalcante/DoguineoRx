//
//  DogTableViewCell.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit
import RxSwift

class DogTableViewCell: UITableViewCell {

    let colors = [ #imageLiteral(resourceName: "blue"), #imageLiteral(resourceName: "pink"), #imageLiteral(resourceName: "gray"), #imageLiteral(resourceName: "yellow"), #imageLiteral(resourceName: "purple"), #imageLiteral(resourceName: "red"), #imageLiteral(resourceName: "green"), #imageLiteral(resourceName: "lightgreen")]
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var viewModel = DogTableViewCellViewModel()
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupBindings()
        if let color = colors.randomElement() {
            backgroundImage.image = color
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func initCell(with dog: Dog) {
        viewModel.bind(dog)
        profileImage.loadImage(dog.imageUrl) { image in
            DispatchQueue.main.async {
                self.profileImage.image = image
                self.profileImage.round()
            }
        }
    }
    
    func setupBindings() {
        self.viewModel.breed
            .drive(name.rx.text)
            .disposed(by: disposeBag)
    }
}
