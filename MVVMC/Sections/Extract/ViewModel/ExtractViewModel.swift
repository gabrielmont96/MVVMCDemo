//
//  LoginViewModel.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import Foundation

protocol ExtractViewModelCoordinatorDelegate: AnyObject {
    func extractViewModelCoordinatorDelegateDidClose(_ viewModel: ExtractViewModel)
}

class ExtractViewModel {
    let title: String
    let value: Double
    
    weak var coordinatorDelegate: ExtractViewModelCoordinatorDelegate?
    
    init(title: String, value: Double) {
        self.title = title
        self.value = value
    }
    
    func close() {
        coordinatorDelegate?.extractViewModelCoordinatorDelegateDidClose(self)
    }
}
