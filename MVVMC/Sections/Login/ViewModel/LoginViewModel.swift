//
//  LoginViewModel.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import Foundation

protocol LoginViewModelCoordinatorDelegate: AnyObject {
    func loginViewModelCoordinatorDidLogin(_ viewModel: LoginViewModel)
}

class LoginViewModel {
    weak var coordinatorDelegate: LoginViewModelCoordinatorDelegate?
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    func login() {
        coordinatorDelegate?.loginViewModelCoordinatorDidLogin(self)
    }
}
