//
//  SignInPresenter.swift
//  modulotech.test
//
//  Created hassine othmane on 1/15/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// SignIn Module Presenter
class SignInPresenter {
    
    weak private var _view: SignInViewProtocol?
    private var interactor: SignInInteractorProtocol
    private var wireframe: SignInRouterProtocol
    
    init(view: SignInViewProtocol) {
        self._view = view
        self.interactor = SignInInteractor()
        self.wireframe = SignInRouter()
    }
}

// MARK: - extending SignInPresenter to implement it's protocol
extension SignInPresenter: SignInPresenterProtocol {
    func sign(objectFor view: SignInViewProtocol, user: SignInEntity) {
        _view!.startLoading()
        interactor.fetch(objectFor: self, user: user)
    }

    func interactor(_ interactor: SignInInteractorProtocol, didFetch object: SignInEntity) {
        _view!.stopLoading()
        self._view?.viewController.dismiss(animated: true, completion: {
        })
    }

    func interactor(_ interactor: SignInInteractorProtocol, didFailWith error: String) {
        _view!.stopLoading()
        _view?.showAlertError(message: error)
        }
}
