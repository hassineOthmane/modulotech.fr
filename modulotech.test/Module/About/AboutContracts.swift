//
//  AboutContracts.swift
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
/// About Module View Protocol
protocol AboutViewProtocol: class, BaseViewProtocol {
    // Update UI with value returned.
    func showAlert()
}

//MARK: Interactor -
/// About Module Interactor Protocol
protocol AboutInteractorProtocol {
    func deleteContactMeData(objectFor presenter: AboutPresenterProtocol)
}

//MARK: Presenter -
/// About Module Presenter Protocol
protocol AboutPresenterProtocol {
    func logout(objectFor view: AboutViewProtocol)
    func showlogoutAlert(objectFor view: AboutViewProtocol)
    func interactor(_ interactor: AboutInteractorProtocol, didDeleted : Bool)
    func interactor(_ interactor: AboutInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// About Module Router Protocol
protocol AboutRouterProtocol {
    func presentSignIn( parentViewController viewController: UIViewController)
}
