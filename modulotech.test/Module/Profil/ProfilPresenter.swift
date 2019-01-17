//
//  ProfilPresenter.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// Profil Module Presenter
class ProfilPresenter {
    
    weak private var _view: ProfilViewProtocol?
    private var interactor: ProfilInteractorProtocol
    private var wireframe: ProfilRouterProtocol
    
    init(view: ProfilViewProtocol) {
        self._view = view
        self.interactor = ProfilInteractor()
        self.wireframe = ProfilRouter()
    }
}

// MARK: - extending ProfilPresenter to implement it's protocol
extension ProfilPresenter: ProfilPresenterProtocol {
    func fetch(objectFor view: ProfilViewProtocol) {
        interactor.fetch(objectFor: self)
    }

    func interactor(_ interactor: ProfilInteractorProtocol, didFetch Contact: Contact) {
        _view?.set(contact: Contact)
    }

    func interactor(_ interactor: ProfilInteractorProtocol, didFailWith error: Error) {
    }
}
