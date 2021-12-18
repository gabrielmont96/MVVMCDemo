//
//  HomeCoordinator.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 30/08/21.
//

import UIKit

class HomeCoordinator: Coordinator {
    var delegate: CoordinatorDelegate?
    var childCoordinator: Coordinator?
    var viewController: UIViewController!
    var navigationController: UINavigationController?
        
    init(title: String) {
        let viewModel = HomeViewModel(title: title)
        viewModel.coordinatorDelegate = self
        viewController = HomeViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: viewController)
    }
}

extension HomeCoordinator: HomeViewModelCoordinatorDelegate {
    func homeViewModelCoordinatorDidTransfer(_ viewModel: HomeViewModel, value: Double) {
        guard let navigation = navigationController else {
            print("navigationController doesn't exist")
            return
        }
        let coordinator = TransferCoordinator(title: "Transfer title", value: value)
        route(to: coordinator, withPresenter: .push(navigation))
    }
}
