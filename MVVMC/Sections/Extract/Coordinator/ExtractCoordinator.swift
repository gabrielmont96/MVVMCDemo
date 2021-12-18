//
//  ExtractCoordinator.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import UIKit

class ExtractCoordinator: Coordinator {
    var delegate: CoordinatorDelegate?
    var childCoordinator: Coordinator?
    var viewController: UIViewController!
    var navigationController: UINavigationController?
    
    init(title: String, value: Double) {
        let viewModel = ExtractViewModel(title: title, value: value)
        viewModel.coordinatorDelegate = self
        viewController = ExtractViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: viewController)
    }
}

extension ExtractCoordinator: ExtractViewModelCoordinatorDelegate {
    func extractViewModelCoordinatorDelegateDidClose(_ viewModel: ExtractViewModel) {
        viewController.dismiss(animated: true)
    }
}
