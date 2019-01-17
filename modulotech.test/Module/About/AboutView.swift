//
//  AboutView.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// About Module View
class AboutView: UIViewController {
    
    private let ui = AboutViewUI()
    private var presenter: AboutPresenterProtocol!
    
    override func loadView() {
        // setting the custom view as the view controller's view
        ui.delegate = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AboutPresenter(view: self)
    }
}

// MARK: - extending AboutView to implement it's protocol
extension AboutView: AboutViewProtocol {
    func showAlert() {
        let alert = UIAlertController(title: "Logout", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:
            { (action) in
                self.presenter.logout(objectFor: self)
        }
        ))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

// MARK: - extending AboutView to implement the custom ui view delegate
extension AboutView: AboutViewUIDelegate {
    func logout() {
        presenter.showlogoutAlert(objectFor: self)
    }
}
