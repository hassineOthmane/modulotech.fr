//
//  ProfilInteractor.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// Profil Module Interactor
class ProfilInteractor: ProfilInteractorProtocol {
    func fetch(objectFor presenter: ProfilPresenterProtocol) {
        let db = ContactDBManager.init()
        db.loadContactMeFromDB { (contact) in
            presenter.interactor(self, didFetch: contact)
        }
    }
}
