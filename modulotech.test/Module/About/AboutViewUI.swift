//
//  AboutViewUI.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

// MARK: AboutViewUI Delegate -
/// AboutViewUI Delegate
protocol AboutViewUIDelegate {
    func logout()
}

class AboutViewUI: UIView {
    
    var delegate: AboutViewUIDelegate?
    var about : UITextView = {
        let txt = UITextView()
        txt.text = textAbout
        txt.textColor = UIColor.white
        txt.backgroundColor = Colors.backgroundColor
        txt.textAlignment = .left
        txt.font = UIFont.init(name: "LucidaGrande", size: 14)
        txt.isEditable = false
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    var logout : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Colors.accentColor
        btn.setTitleColor(Colors.backgroundColor, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.init(name: "lucida grande", size: 16)
        btn.setTitle("Log out", for: UIControl.State.normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 19
        return btn
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
        self.addSubview(about)
        self.addSubview(logout)
        logout.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }

    @objc func buttonClicked(sender : UIButton){
        delegate?.logout()
    }
    
    fileprivate func setupConstraints() {
        // add constraints to subviews

        var constraints = [NSLayoutConstraint]()

        //MARK: searchBar constraints
        constraints += [NSLayoutConstraint.init(item: about, attribute: .top, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 15)] // .top
        constraints += [NSLayoutConstraint.init(item: about, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 20)] //.leading
        constraints += [NSLayoutConstraint.init(item: about, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -20)] //.leading
        constraints += [NSLayoutConstraint.init(item: about, attribute: .bottom, relatedBy: .equal, toItem: self.logout, attribute: .top, multiplier: 1.0, constant: -20)] //.leading

        constraints += [NSLayoutConstraint.init(item: logout, attribute: .bottom, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -20)]
        //stackView.leading = .leading + 50
        constraints += [NSLayoutConstraint.init(item: logout, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 55)]
        //stackView.leading = .leading + 50
        constraints += [NSLayoutConstraint.init(item: logout, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -55)]
        constraints += [NSLayoutConstraint.init(item: logout, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)]

        self.addConstraints(constraints)
    }
    
}
