//
//  AppCoordinator.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import UIKit

class AppCoordinator {
    let window: UIWindow
    let isLoggedIn = false // Boolean that tells if the user is logged in
    
    var loginCoordinator: LoginCoordinator?
    var homeCoordinator: HomeCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        if isLoggedIn {
            let coordinator = HomeCoordinator(title: "Home title")
            window.rootViewController = coordinator.viewController
            homeCoordinator = coordinator
        } else {
            let coordinator = LoginCoordinator(title: "Login title")
            coordinator.delegate = self
            window.rootViewController = coordinator.viewController
            loginCoordinator = coordinator
        }
    }
}

extension AppCoordinator: CoordinatorDelegate {
    func didFinish(_ coordinator: Coordinator, data: Data?) {
        loginCoordinator = nil
        let coordinator = HomeCoordinator(title: "Home title")
        window.rootViewController = coordinator.navigationController!
        homeCoordinator = coordinator
    }
}
