//
//  ContactTableViewCell.swift
//  modulotech.test
//
//  Created by hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit


class ContactTableViewCell : UITableViewCell {

    let cellUI = ContactCellUI()

    var contact : Contact? {
        didSet {
            cellUI.contact = contact
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        cellUI.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cellUI)
        self.selectionStyle = .none
        self.backgroundColor = Colors.backgroundColorSecond
        cellUI.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                       constant: 0).isActive=true
        cellUI.topAnchor.constraint(equalTo: self.topAnchor,
                                       constant: 0).isActive=true
        cellUI.rightAnchor.constraint(equalTo: self.rightAnchor,
                                       constant: 0).isActive=true
        cellUI.leftAnchor.constraint(equalTo: self.leftAnchor,
                                    constant: 0).isActive=true
    }

}


