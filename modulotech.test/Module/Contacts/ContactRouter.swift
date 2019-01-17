//
//  ContactRouter.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// Contact Module Router (aka: Wireframe)
class ContactRouter: ContactRouterProtocol {
    func showDetail(parentViewController viewController: UIViewController, contact: Contact) {
        let vc = DetailContactView.init(contact: contact)
        viewController.show(vc, sender: nil)
    }

    func presentSignIn(parentViewController viewController: UIViewController) {
        let vc = SignInView()
        viewController.present(vc, animated: true) {
        }
    }
}
