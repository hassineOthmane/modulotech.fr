//
//  AboutRouter.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// About Module Router (aka: Wireframe)
class AboutRouter: AboutRouterProtocol {
    func presentSignIn(parentViewController viewController: UIViewController) {
        let vc = SignInView()
        viewController.present(vc, animated: true) {
        }
    }
}
