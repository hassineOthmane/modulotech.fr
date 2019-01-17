//
//  ProfilView.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// Profil Module View
class ProfilView: UIViewController {
    
    private let ui = ProfilViewUI()
    private var presenter: ProfilPresenterProtocol!
    private var object : ProfilEntity?
    fileprivate var contactMe : Contact?
    override func loadView() {
        ui.dataSource = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProfilPresenter(view: self)
        presenter.fetch(objectFor: self)
    }
}

// MARK: - extending ProfilView to implement it's protocol
extension ProfilView: ProfilViewProtocol {
    func set(contact: Contact) {
        contactMe = contact
        self.ui.reloadData()
    }
}

// MARK: - extending ProfilView to implement the custom ui view data source
extension ProfilView: ProfilViewUIDataSource {
    func objectFor(ui: ProfilViewUI) -> Contact {
        return contactMe!
    }
}
