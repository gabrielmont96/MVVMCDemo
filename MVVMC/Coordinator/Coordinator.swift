//
//  Coordinator.swift
//  MVVMC
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 18/12/21.
//

import UIKit

public protocol CoordinatorDelegate: AnyObject {
    func didFinish(_ coordinator: Coordinator, data: Data?)
}

extension CoordinatorDelegate {
    public func didFinish(_ coordinator: Coordinator, data: Data? = nil) {}
}

public protocol Coordinator: CoordinatorDelegate {
    var delegate: CoordinatorDelegate? { get set }
    var childCoordinator: Coordinator? { get set }
    var viewController: UIViewController! { get set }
    var navigationController: UINavigationController? { get set }
    
    func stop()
    func start(usingPresenter presenter: CoordinatorPresenter, animated: Bool)
    func performStart(usingPresenter presenter: CoordinatorPresenter, animated: Bool)
    func route(to coordinator: Coordinator, withPresenter presenter: CoordinatorPresenter, animated: Bool, delegate: CoordinatorDelegate?)
    func didFinish(_ coordinator: Coordinator, data: Encodable?)
}

extension Coordinator {
    public func route(to coordinator: Coordinator, withPresenter presenter: CoordinatorPresenter, animated: Bool = true, delegate: CoordinatorDelegate? = nil) {
        childCoordinator = coordinator
        coordinator.delegate = delegate ?? self
        coordinator.start(usingPresenter: presenter, animated: animated)
    }

    public func didFinish(_ coordinator: Coordinator, data: Encodable? = nil) {
        coordinator.stop()
        childCoordinator = nil
    }

    public func start(usingPresenter presenter: CoordinatorPresenter, animated: Bool = true) {
        performStart(usingPresenter: presenter, animated: animated)
    }

    public func stop() {
        delegate = nil
        viewController = nil
        childCoordinator = nil
        navigationController = nil
    }
    
    public func performStart(usingPresenter presenter: CoordinatorPresenter, animated: Bool) {
        navigationController = presenter.present(destiny: viewController, animated: animated)
    }
}

