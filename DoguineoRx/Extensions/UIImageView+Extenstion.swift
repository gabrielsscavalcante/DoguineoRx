//
//  UIImageView+Extenstion.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit

extension UIImageView {

    func loadImage(_ url: String, completion: @escaping(_ image: UIImage) -> Void) {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            if error == nil {
                guard let data = data else { return }
                guard let image = UIImage(data: data) else { return }
                completion(image)
            } else {
                print(error ?? "Error to download Image")
            }
        }.resume()
    }
}
