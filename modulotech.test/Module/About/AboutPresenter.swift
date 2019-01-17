//
//  AboutPresenter.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// About Module Presenter
class AboutPresenter {
    
    weak private var _view: AboutViewProtocol?
    private var interactor: AboutInteractorProtocol
    private var wireframe: AboutRouterProtocol
    
    init(view: AboutViewProtocol) {
        self._view = view
        self.interactor = AboutInteractor()
        self.wireframe = AboutRouter()
    }
}

// MARK: - extending AboutPresenter to implement it's protocol
extension AboutPresenter: AboutPresenterProtocol {

    func showlogoutAlert(objectFor view: AboutViewProtocol) {
        view.showAlert()
    }
    func logout(objectFor view: AboutViewProtocol) -> Void {
        interactor.deleteContactMeData(objectFor: self)
    }

    func interactor(_ interactor: AboutInteractorProtocol, didDeleted : Bool) {
        wireframe.presentSignIn(parentViewController: self._view!.viewController)
    }

    func interactor(_ interactor: AboutInteractorProtocol, didFailWith error: Error) {
        
    }
}
