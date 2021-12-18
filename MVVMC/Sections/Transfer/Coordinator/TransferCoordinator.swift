//
//  TransferCoordinator.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import UIKit

class TransferCoordinator: Coordinator {
    var delegate: CoordinatorDelegate?
    var childCoordinator: Coordinator?
    var viewController: UIViewController!
    var navigationController: UINavigationController?
    
    init(title: String, value: Double) {
        let viewModel = TransferViewModel(title: title, value: value)
        viewModel.coordinatorDelegate = self
        viewController = TransferViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: viewController)
    }
}

extension TransferCoordinator: TransferViewModelCoordinatorDelegate {
    func transferViewModelCoordinatorDidContinue(_ viewModel: TransferViewModel, amount: Double) {
        let coordinator = ExtractCoordinator(title: "Extract title", value: amount)
        route(to: coordinator, withPresenter: .present(viewController, .overFullScreen))
    }
}
