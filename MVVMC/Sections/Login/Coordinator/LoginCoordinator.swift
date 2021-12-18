//
//  LoginCoordinator.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import UIKit

class LoginCoordinator: Coordinator {
    var delegate: CoordinatorDelegate?
    var childCoordinator: Coordinator?
    var viewController: UIViewController!
    var navigationController: UINavigationController?
    
    init(title: String) {
        let viewModel = LoginViewModel(title: title)
        viewModel.coordinatorDelegate = self
        viewController = LoginViewController(viewModel: viewModel)
    }
}

extension LoginCoordinator: LoginViewModelCoordinatorDelegate {
    func loginViewModelCoordinatorDidLogin(_ viewModel: LoginViewModel) {
        delegate?.didFinish(self, data: nil)
    }
}
