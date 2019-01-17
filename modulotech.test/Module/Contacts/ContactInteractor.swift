//
//  ContactInteractor.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// Contact Module Interactor
class ContactInteractor: ContactInteractorProtocol {

    func fetchToRefresh(objectFor presenter: ContactPresenterProtocol) {
        let db = ContactDBManager.init()
        let contactRemoteDM = ContactRemoteDataManager ()
        contactRemoteDM.fetchContacts { (contacts, error) in
            if((error) == nil && contacts.count > 0)
            {
                db.save(contacts: contacts, finished: {
                    DispatchQueue.main.async {
                        presenter.interactor(self, didFetch: contacts)
                    }
                })
            }
            else
            {
                presenter.interactor(self, didFailWith: error!)
            }
        }
    }

    func fetch(objectFor presenter: ContactPresenterProtocol) {

        let useranem = UserDefaults.standard.string(forKey: "username")
        if (useranem != nil)
        {
            let db = ContactDBManager.init()
            db.loadContactsFromDB { (contacts) in
                presenter.interactor(self, didFetch: contacts)
                let contactRemoteDM = ContactRemoteDataManager ()
                contactRemoteDM.fetchContacts { (contacts, error) in
                    if((error) == nil)
                    {
                        db.save(contacts: contacts, finished: {
                            DispatchQueue.main.async {
                                presenter.interactor(self, didFetch: contacts)
                            }
                        })
                    }
                    else
                    {
                        presenter.interactor(self, didFailWith: error!)
                    }
                }
            }
        }
        else
        {
            presenter.interactor(self, notConnected: true)
        }
    }
}
