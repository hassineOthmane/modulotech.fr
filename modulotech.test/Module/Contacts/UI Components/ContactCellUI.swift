//
//  ContactCellUI.swift
//  modulotech.test
//
//  Created by hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit
import SDWebImage


class ContactCellUI : UIView {

    var contact : Contact? {
        didSet {
            guard let contact = self.contact else { return }

            // Set Values
            name.text = "\(String(describing: contact.title!)), \(String(describing: contact.first!)) \(String(describing: contact.last!))"
            adress.text = "\(String(describing: contact.city!)), \(String(describing: contact.state!))"
            profil.sd_setImage(with: URL.init(string: contact.medium!)) { (img, error, cache, url) in
            }
            updateConstraints()
            updateConstraintsIfNeeded()
            layoutIfNeeded()
            layoutSubviews()
        }
    }

    var profil : UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "profil")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 23
        img.clipsToBounds = true
        return img
    }()

    let vStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    var name : UILabel = {
        let txt = UILabel()
        txt.textColor = UIColor.white
        txt.textAlignment = .left
        txt.font = UIFont.init(name: "LucidaGrande-Bold", size: 12)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    var adress : UILabel = {
        let txt = UILabel()
        txt.textAlignment = .left
        txt.textColor = UIColor.white
        txt.font = UIFont.init(name: "LucidaGrande", size: 12)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    var details : UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.init(name: "LucidaGrande", size: 12)
        btn.setTitle("details", for: UIControl.State.normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 19
        return btn
    }()


    var v : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.blue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    var onButtonTapped : (() -> Void)? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    @objc func buttonClicked(sender : UIButton){
        onButtonTapped!()

    }

    private func setupUI() {
        self.addSubview(profil)
        self.addSubview(vStackView)
        vStackView.addArrangedSubview(name)
        vStackView.addArrangedSubview(adress)
        self.addSubview(details)
        details.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)

        var constraints = [NSLayoutConstraint]()

        //MARK: profil image constraints
        constraints += [NSLayoutConstraint.init(item: profil, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 15)] // .top
        constraints += [NSLayoutConstraint.init(item: profil, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 8)] //.leading
        constraints += [NSLayoutConstraint.init(item: profil, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 46)] //.width
        constraints += [NSLayoutConstraint.init(item: profil, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 46)] //.width

         //MARK: vStackView
        constraints += [NSLayoutConstraint.init(item: vStackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 30)]  //top
        constraints += [NSLayoutConstraint.init(item: vStackView, attribute: .leading, relatedBy: .equal, toItem: self.profil, attribute: .trailing, multiplier: 1.0, constant: 30)] //leading

         //MARK: vStackView
        constraints += [NSLayoutConstraint.init(item: details, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 35)]  //top
        constraints += [NSLayoutConstraint.init(item: details, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -20)] //trailing
        constraints += [NSLayoutConstraint.init(item: details, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 46)] //width

        self.addConstraints(constraints)
    }
}

