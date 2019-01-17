//
//  ContactView.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// Contact Module View
class ContactView: UIViewController {
    
    private let ui = ContactViewUI()
    private var presenter: ContactPresenterProtocol!
    fileprivate var contacts : [Contact] = []

    override func loadView() {
        // setting the custom view as the view controller's view
        ui.delegate = self
        ui.dataSource = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ContactPresenter(view: self)
        // Informs the Presenter that the View is ready to receive data.

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        if(contacts.count ==  0)
        {
            presenter.fetch(objectFor: self)
            self.ui.startRefreshAnimationData()
        }
    }
}

// MARK: - extending ContactView to implement it's protocol
extension ContactView: ContactViewProtocol {
    func set(contacts: [Contact]) {
        self.contacts = contacts
        DispatchQueue.main.async {
            self.ui.reloadData()
        }
    }
}

// MARK: - extending ContactView to implement the custom ui view delegate
extension ContactView: ContactViewUIDelegate {
    func showDetailContact(didSelect: Contact) {
       // presenter.
       //   self.show(DetailContactView(), sender: nil)
        presenter.showDetail(objectFor: self, contact: didSelect)
    }

    func refresh() {
        presenter.refresh(objectFor: self)
    }

    func showAlertError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (alert: UIAlertAction!) in
            self.ui.endRefreshAnimationData()
        }))
        self.present(alert, animated: true)

    }
}

// MARK: - extending ContactView to implement the custom ui view data source
extension ContactView: ContactViewUIDataSource {
    func objectFor(ui: ContactViewUI) -> [Contact] {
        return contacts
    }
}
