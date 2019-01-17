//
//  ContactViewUI.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

// MARK: ContactViewUI Delegate -
/// ContactViewUI Delegate
protocol ContactViewUIDelegate {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
    func refresh()
    func showDetailContact(didSelect: Contact)
   
}

// MARK: ContactViewUI Data Source -
/// ContactViewUI Data Source
protocol ContactViewUIDataSource {
    // This will be implemented in the Module View.
    /// Set Object for the UI Component
    func objectFor(ui: ContactViewUI) -> [Contact]

}

class ContactViewUI: UIView {
    
    var delegate: ContactViewUIDelegate?
    var dataSource: ContactViewUIDataSource?
    
    var contacts : [Contact]?
    var contactsFiltred : [Contact]?
    fileprivate var cellID = "contactUITableViewCell"

    private let refreshControl = UIRefreshControl()

    var searchBar : UISearchBar = {
        let sbSearchBar = UISearchBar()
        sbSearchBar.barTintColor = Colors.backgroundColor
        sbSearchBar.tintColor = UIColor.white
        sbSearchBar.backgroundColor = Colors.backgroundColor
        sbSearchBar.layer.borderWidth = 1
        sbSearchBar.layer.borderColor = Colors.backgroundColor.cgColor
        sbSearchBar.searchBarStyle = .prominent;
        sbSearchBar.translatesAutoresizingMaskIntoConstraints = false
        if let textfield = sbSearchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = Colors.backgroundColorSecond
            textfield.textColor = UIColor.white
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])

            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.white
            }
        }
        return sbSearchBar
    }()


    lazy var tableView : UITableView = {
        let tbl = UITableView()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.separatorColor = .clear
        tbl.backgroundColor = Colors.backgroundColor
        tbl.register(ContactTableViewCell.self, forCellReuseIdentifier: cellID)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.addSubview(refreshControl)
        return tbl
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    fileprivate func setupUIElements() {
        // arrange subviews
        self.backgroundColor = Colors.backgroundColor
        self.addSubview(searchBar)
        self.addSubview(tableView)
        searchBar.delegate = self
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        hideKeyboard()
    }

    @objc private func refreshWeatherData(_ sender: Any) {
        // Fetch Weather Data
        delegate?.refresh()
    }
    
    fileprivate func setupConstraints() {
        // add constraints to subviews
        var constraints = [NSLayoutConstraint]()
        
        //MARK: searchBar constraints
        constraints += [NSLayoutConstraint.init(item: searchBar, attribute: .top, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 15)] // searchBar.top = safeAreaLayoutGuide.top + 15
        constraints += [NSLayoutConstraint.init(item: searchBar, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 20)] // searchBar.leading = safeAreaLayoutGuide.leading + 20
        constraints += [NSLayoutConstraint.init(item: searchBar, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -20)] // searchBar.leading = safeAreaLayoutGuide.trailing + 20


        //MARK: tableview constraints
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.searchBar, attribute: .bottom, multiplier: 1.0, constant: 70)] // tableView.top = searchBar.bottom + 70
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 15)] // tableView.leading = safeAreaLayoutGuide.leading + 15
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -15)] // tableView.trailing = safeAreaLayoutGuide.trailing - 15
        constraints += [NSLayoutConstraint.init(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -20)] // tableView.bottom = safeAreaLayoutGuide.bottom - 20


        self.addConstraints(constraints)
    }
    
    /// Reloading the data and update the ui according to the new data
    func reloadData() {
         DispatchQueue.main.async {
            self.contacts = self.dataSource?.objectFor(ui: self)
            self.contactsFiltred = self.contacts
        self.tableView.reloadData()
            self.endRefreshAnimationData()
        }
    }

    func startRefreshAnimationData() {
        self.refreshControl.tintColor  = UIColor.white
        self.refreshControl.beginRefreshing()
    }

    func endRefreshAnimationData() {
        self.refreshControl.endRefreshing()
    }
}


extension ContactViewUI: UITableViewDataSource {
    // Number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactsFiltred?.count ?? 0
    }

    // Number for Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ContactTableViewCell else {
            fatalError("Misconfigured cell!")
        }
        cell.contact = contactsFiltred?[indexPath.section]
        cell.cellUI.onButtonTapped = {
            self.delegate?.showDetailContact( didSelect: (self.contactsFiltred![indexPath.section]))
        }
        return cell
    }

}

extension ContactViewUI: UITableViewDelegate {
    // Height For Row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init()
        view.backgroundColor = Colors.backgroundColor
        return view
    }
}

extension ContactViewUI: UISearchBarDelegate {
    // MARK: - UISearchResultsUpdating Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        contactsFiltred = contacts!.filter { (contact) -> Bool in
            return contact.first.uppercased().contains(searchBar.text!.uppercased())
                || contact.last.uppercased().contains(searchBar.text!.uppercased())
        }

        if (searchBar.text == "")
        {
            contactsFiltred = contacts
        }
        tableView.reloadData()
    }
}
