//
//  ContactContracts.swift
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
/// Contact Module View Protocol
protocol ContactViewProtocol: class, BaseViewProtocol {
    // Update UI with value returned.
    /// Set the view Object of Type ContactEntity
    func set(contacts: [Contact])
     func showAlertError(message: String)
}

//MARK: Interactor -
/// Contact Module Interactor Protocol
protocol ContactInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: ContactPresenterProtocol)
    func fetchToRefresh(objectFor presenter: ContactPresenterProtocol)

}

//MARK: Presenter -
/// Contact Module Presenter Protocol
protocol ContactPresenterProtocol {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: ContactViewProtocol)
    func refresh(objectFor view: ContactViewProtocol)
        func showDetail(objectFor view: ContactViewProtocol, contact: Contact)
    func interactor(_ interactor: ContactInteractorProtocol, didFetch contacts: [Contact])
    func interactor(_ interactor: ContactInteractorProtocol, didFailWith error: String)
    func interactor(_ interactor: ContactInteractorProtocol, notConnected : Bool)
}

//MARK: Router (aka: Wireframe) -
/// Contact Module Router Protocol
protocol ContactRouterProtocol {
     func presentSignIn( parentViewController viewController: UIViewController)
    func showDetail( parentViewController viewController: UIViewController, contact: Contact)
}
