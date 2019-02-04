//
//  AppDelegate.swift
//  DoguineoRx
//
//  Created by Gabriel Cavalcante on 02/02/19.
//  Copyright © 2019 GabrielCavalcante. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var defaultContainer: DefaultContainer!
    var appCoordinator: AppCoordinator!


    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
        
        self.defaultContainer = DefaultContainer()
        
        let navigationController = UINavigationController()
        let currentWindow = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(navigationController: navigationController,
                                             window: currentWindow,
                                             container: defaultContainer.container)
        self.appCoordinator?.start()
        self.window = currentWindow
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

