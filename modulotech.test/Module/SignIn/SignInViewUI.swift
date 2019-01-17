//
//  SignInViewUI.swift
//  modulotech.test
//
//  Created hassine othmane on 1/15/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

// MARK: SignInViewUI Delegate -
/// SignInViewUI Delegate
protocol SignInViewUIDelegate {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
    func signIn(user: SignInEntity)
}


class SignInViewUI: UIView {
    
    var delegate: SignInViewUIDelegate?
    // ui components
    var logo : UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "logo")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    let vStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 25
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    var username : UITextField = {
        let txt = UITextField()
        txt.textColor = UIColor.white
        txt.textAlignment = .left
        txt.font = UIFont.init(name: "LucidaGrande", size: 16)
        txt.attributedPlaceholder = NSAttributedString(string: "username",attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor])
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    var password : UITextField = {
        let txt = UITextField()
        txt.textAlignment = .left
        txt.isSecureTextEntry = true
        txt.attributedPlaceholder = NSAttributedString(string: "password",attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolderColor])
        txt.textColor = UIColor.white
        txt.font = UIFont.init(name: "LucidaGrande", size: 16)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    var signIn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Colors.accentColor
        btn.setTitleColor(Colors.backgroundColor, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.init(name: "LucidaGrande", size: 16)
        btn.setTitle("SignIn", for: UIControl.State.normal)
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

        self.backgroundColor = Colors.backgroundColor
        // arrange subviews
        self.addSubview(logo)
        self.addSubview(vStackView)
        vStackView.addArrangedSubview(username)
        vStackView.addArrangedSubview(password)
        self.addSubview(signIn)
        self.addLineToView(view: username, position:.LINE_POSITION_BOTTOM, color: Colors.accentColor, width: 0.5)
        self.addLineToView(view: password, position:.LINE_POSITION_BOTTOM, color: Colors.accentColor, width: 0.5)
        //Targets
        signIn.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        hideKeyboard()
    }

    @objc func buttonClicked(sender : UIButton){
        delegate?.signIn(user: SignInEntity.init(username : username.text, password:password.text))
    }
    
    fileprivate func setupConstraints() {

        var constraints = [NSLayoutConstraint]()
        // add constraints to subviews

        //MARK: logo
        constraints += [NSLayoutConstraint.init(item: logo, attribute: .top, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 75)] // .top
        constraints += [NSLayoutConstraint.init(item: logo, attribute: .centerX, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0)] //.centerX

        //MARK: vStackView
        constraints += [NSLayoutConstraint.init(item: vStackView, attribute: .top, relatedBy: .equal, toItem: self.logo, attribute: .top, multiplier: 1.0, constant: 75)]  //vStackView.top = logo.top + 100
        constraints += [NSLayoutConstraint.init(item: vStackView, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 55)] //vStackView.leading = safeAreaLayoutGuide.leading + 55
        constraints += [NSLayoutConstraint.init(item: vStackView, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -55)] //vStackView.trailing = safeAreaLayoutGuide.trailing - 55

        //MARK: signIn
        constraints += [NSLayoutConstraint.init(item: signIn, attribute: .top, relatedBy: .equal, toItem: self.vStackView, attribute: .bottom, multiplier: 1.0, constant: 80)] //signIn.top = .vStackView + 100
        constraints += [NSLayoutConstraint.init(item: signIn, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 55)] //signIn.leading = safeAreaLayoutGuide.leading + 55
        constraints += [NSLayoutConstraint.init(item: signIn, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -55)] //signIn.trailing = safeAreaLayoutGuide.trailing - 55
        constraints += [NSLayoutConstraint.init(item: signIn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)] // signIn.height = 40

        //MARK: username
        constraints += [NSLayoutConstraint.init(item: username, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)] // username.height = 40

        //MARK: password
        constraints += [NSLayoutConstraint.init(item: password, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)] // password.height = 40

        self.addConstraints(constraints)
    }
}
