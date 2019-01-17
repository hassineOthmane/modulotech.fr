//
//  DetailContactView.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// DetailContact Module View
class DetailContactView: UIViewController {
    
    private let ui = DetailContactViewUI()
    private var presenter: DetailContactPresenterProtocol!
    
    private var contact : Contact?
    
    override func loadView() {
        // setting the custom view as the view controller's view
        ui.dataSource = self
        view = ui
    }

    init(contact : Contact) {
        super.init(nibName: nil, bundle: nil)
        self.contact = contact
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DetailContactPresenter(view: self)
        self.ui.reloadData()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = Colors.backgroundColor
          navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
}

// MARK: - extending DetailContactView to implement it's protocol
extension DetailContactView: DetailContactViewProtocol {
    func set(object: DetailContactEntity) {
    }
}


// MARK: - extending DetailContactView to implement the custom ui view data source
extension DetailContactView: DetailContactViewUIDataSource {
    func objectFor(ui: DetailContactViewUI) -> Contact {
        return contact!
    }
}
