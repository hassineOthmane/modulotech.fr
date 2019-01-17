//
//  ContactPresenter.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// Contact Module Presenter
class ContactPresenter {
    
    weak private var _view: ContactViewProtocol?
    private var interactor: ContactInteractorProtocol
    private var wireframe: ContactRouterProtocol
    
    init(view: ContactViewProtocol) {
        self._view = view
        self.interactor = ContactInteractor()
        self.wireframe = ContactRouter()
    }
}

// MARK: - extending ContactPresenter to implement it's protocol
extension ContactPresenter: ContactPresenterProtocol {

    func fetch(objectFor view: ContactViewProtocol) {
      //   _view?.startLoading()
        interactor.fetch(objectFor: self)
    }
    func refresh(objectFor view: ContactViewProtocol) {
        //   _view?.startLoading()
        interactor.fetchToRefresh(objectFor: self)
    }
    func showDetail(objectFor view: ContactViewProtocol, contact: Contact) {
        wireframe.showDetail(parentViewController: self._view!.viewController, contact: contact)
    }

    func interactor(_ interactor: ContactInteractorProtocol, didFetch contacts: [Contact]) {
        _view?.set(contacts: contacts)
    }

    func interactor(_ interactor: ContactInteractorProtocol, didFailWith error: String) {
        _view?.showAlertError(message: error)
    }

    func interactor(_ interactor: ContactInteractorProtocol, notConnected: Bool) {
         wireframe.presentSignIn(parentViewController: _view!.viewController)
    }
}
