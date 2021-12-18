//
//  LoginViewModel.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import Foundation

protocol TransferViewModelCoordinatorDelegate: AnyObject {
    func transferViewModelCoordinatorDidContinue(_ viewModel: TransferViewModel, amount: Double)
}

class TransferViewModel {
    weak var coordinatorDelegate: TransferViewModelCoordinatorDelegate?
    let title: String
    let value: Double
    
    init(title: String, value: Double) {
        self.title = title
        self.value = value
    }
    
    func extract() {
        coordinatorDelegate?.transferViewModelCoordinatorDidContinue(self, amount: value)
    }
}
