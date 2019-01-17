//
//  DetailContactContracts.swift
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
/// DetailContact Module View Protocol
protocol DetailContactViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type DetailContactEntity
    func set(object: DetailContactEntity)
}

//MARK: Interactor -
/// DetailContact Module Interactor Protocol
protocol DetailContactInteractorProtocol {

}

//MARK: Presenter -
/// DetailContact Module Presenter Protocol
protocol DetailContactPresenterProtocol {
  }

//MARK: Router (aka: Wireframe) -
/// DetailContact Module Router Protocol
protocol DetailContactRouterProtocol {

}
