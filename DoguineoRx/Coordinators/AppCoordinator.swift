//
//  AppCoordinator.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 03/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit
import Swinject

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    let container: Container
    
    var navigationController: UINavigationController
    
    var currentView: UIViewController? {
        get {
            return window.rootViewController
        }
        set {
            UIView.transition(with: self.window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.window.rootViewController = newValue
            }, completion: nil)
        }
    }
    
    init(navigationController: UINavigationController, window: UIWindow, container: Container) {
        self.window = window
        self.container = container
        self.navigationController = navigationController
    }
    
    func start() {
        showApresentationViewController()
    }
    
    fileprivate func showApresentationViewController() {
        let view = container.resolve(ApresentationViewController.self)!
        view.delegate = self
        navigationController.viewControllers = [view]
        self.currentView = navigationController
    }
}

extension AppCoordinator: ApresentationDelegate {
    
    func navigateToDraw() {
        print("navigate to draw")
    }
}
