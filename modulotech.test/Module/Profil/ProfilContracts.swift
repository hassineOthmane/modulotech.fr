//
//  ProfilContracts.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// Profil Module View Protocol
protocol ProfilViewProtocol: class {
    // Update UI with value returned.
    func set(contact: Contact)
}

//MARK: Interactor -
/// Profil Module Interactor Protocol
protocol ProfilInteractorProtocol {
    func fetch(objectFor presenter: ProfilPresenterProtocol)
}

//MARK: Presenter -
/// Profil Module Presenter Protocol
protocol ProfilPresenterProtocol {
    func fetch(objectFor view: ProfilViewProtocol)
    func interactor(_ interactor: ProfilInteractorProtocol, didFetch contact: Contact)
    func interactor(_ interactor: ProfilInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// Profil Module Router Protocol
protocol ProfilRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
}
