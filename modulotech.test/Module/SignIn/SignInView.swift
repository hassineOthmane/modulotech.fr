//
//  SignInView.swift
//  modulotech.test
//
//  Created hassine othmane on 1/15/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// SignIn Module View
class SignInView: UIViewController {
    
    private let ui = SignInViewUI()
    private var presenter: SignInPresenterProtocol!
    
    override func loadView() {
        // setting the custom view as the view controller's view
        ui.delegate = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SignInPresenter(view: self)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

// MARK: - extending SignInView to implement it's protocol
extension SignInView: SignInViewProtocol {
    func showAlertError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

// MARK: - extending SignInView to implement the custom ui view delegate
extension SignInView: SignInViewUIDelegate {
    func signIn(user : SignInEntity) {
        presenter.sign(objectFor: self, user: user)
    }
}

