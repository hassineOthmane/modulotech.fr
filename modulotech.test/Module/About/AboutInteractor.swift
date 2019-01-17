//
//  AboutInteractor.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// About Module Interactor
class AboutInteractor: AboutInteractorProtocol {
    func deleteContactMeData(objectFor presenter: AboutPresenterProtocol) {
        let db = ContactDBManager.init()
        db.clearOldMeResults()
        clearPersistedUser()
        presenter.interactor(self, didDeleted: true)
    }
    func clearPersistedUser() -> Void {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.synchronize()
    }


}
