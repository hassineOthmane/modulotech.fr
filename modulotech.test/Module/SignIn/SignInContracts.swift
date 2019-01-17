//
//  SignInContracts.swift
//  modulotech.test
//
//  Created hassine othmane on 1/15/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// SignIn Module View Protocol
protocol SignInViewProtocol: class, BaseViewProtocol {
    // Update UI with value returned.
    /// Set the view Object of Type SignInEntity
    func showAlertError(message: String)
}

//MARK: Interactor -
/// SignIn Module Interactor Protocol
protocol SignInInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: SignInPresenterProtocol, user: SignInEntity)
}

//MARK: Presenter -
/// SignIn Module Presenter Protocol
protocol SignInPresenterProtocol {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func sign(objectFor view: SignInViewProtocol, user: SignInEntity)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: SignInInteractorProtocol, didFetch object: SignInEntity)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: SignInInteractorProtocol, didFailWith error: String)
}

//MARK: Router (aka: Wireframe) -
/// SignIn Module Router Protocol
protocol SignInRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
}
