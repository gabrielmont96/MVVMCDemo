//
//  LoginViewModel.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import Foundation

protocol HomeViewModelCoordinatorDelegate: AnyObject {
    func homeViewModelCoordinatorDidTransfer(_ viewModel: HomeViewModel, value: Double)
}

class HomeViewModel {
    weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    func doTransfer(value: Double) {
        coordinatorDelegate?.homeViewModelCoordinatorDidTransfer(self, value: value)
    }
}
