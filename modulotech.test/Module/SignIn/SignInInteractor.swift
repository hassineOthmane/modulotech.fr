//
//  SignInInteractor.swift
//  modulotech.test
//
//  Created hassine othmane on 1/15/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// SignIn Module Interactor
class SignInInteractor: SignInInteractorProtocol {

    func fetch(objectFor presenter: SignInPresenterProtocol, user: SignInEntity) {
        let contactRemoteDM = ContactRemoteDataManager ()
        contactRemoteDM.signIn(user: user) { (contact,error) in
            if(error == nil && contact != nil)
            {
                presenter.interactor(self, didFetch: user)
                self.persistUser(user: user)
                let db = ContactDBManager.init()
                db.saveMe(contact: contact!, finished: {
                })
            }
            else
            {
                presenter.interactor(self, didFailWith: error!)
            }
        }
    }

    func persistUser(user:SignInEntity) -> Void {
        UserDefaults.standard.setValue(user.username, forKeyPath: "username")
        UserDefaults.standard.synchronize()
    }
}
