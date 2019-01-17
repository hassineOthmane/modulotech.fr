//
//  DetailContactViewUI.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit



// MARK: DetailContactViewUI Data Source -
/// DetailContactViewUI Data Source
protocol DetailContactViewUIDataSource {
    // This will be implemented in the Module View.
    func objectFor(ui: DetailContactViewUI) -> Contact
}

class DetailContactViewUI: UIView {
    var dataSource: DetailContactViewUIDataSource?
    var object : Contact?


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
        txt.font = UIFont.init(name: "LucidaGrande-Bold", size: 16)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    var city : UILabel = {
        let txt = UILabel()
        txt.textAlignment = .left
        txt.textColor = UIColor.white
        txt.font = UIFont.init(name: "LucidaGrande", size: 14)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    var profil : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 37
        img.clipsToBounds = true
        return img
    }()

    var line : UIView = {
        let l = UIView()
        l.backgroundColor = UIColor(red:0.21, green:0.74, blue:0.76, alpha:1.0)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()


    let vDetailsStackView : UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    var adressView : UIView = {
        let l = UIView()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    var phoneView : UIView = {
        let l = UIView()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    var emailView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    var emailIcon : UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "email")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var emailBackgroundView : UIView = {
        let v = UIView()
        v.backgroundColor = Colors.backgroundColorSecond
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var email : UILabel = {
        let txt = UILabel()
        txt.textAlignment = .left
        txt.textColor = UIColor.white
        txt.font = UIFont.init(name: "LucidaGrande-Bold", size: 14)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    var phoneIcon : UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "phone")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var phoneBackgroundView : UIView = {
        let v = UIView()
        v.backgroundColor = Colors.backgroundColorSecond
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    var phone : UILabel = {
        let txt = UILabel()
        txt.textAlignment = .left
        txt.textColor = UIColor.white
        txt.font = UIFont.init(name: "LucidaGrande-Bold", size: 14)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()


    var adressIcon : UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "marker")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var adressBackgroundView : UIView = {
        let v = UIView()
        v.backgroundColor = Colors.backgroundColorSecond
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    var adress : UILabel = {
        let txt = UILabel()
        txt.textAlignment = .left
        txt.textColor = UIColor.white
        txt.font = UIFont.init(name: "LucidaGrande-Bold", size: 14)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
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
        self.addSubview(vStackView)
        vStackView.addArrangedSubview(name)
        vStackView.addArrangedSubview(city)
        self.addSubview(profil)
        self.addSubview(line)

        self.addSubview(vDetailsStackView)

        emailView.addSubview(emailIcon)
        emailView.addSubview(emailBackgroundView)
        emailBackgroundView.addSubview(email)

        phoneView.addSubview(phoneIcon)
        phoneView.addSubview(phoneBackgroundView)
        phoneView.addSubview(phone)


        adressView.addSubview(adressIcon)
        adressView.addSubview(adressBackgroundView)
        adressView.addSubview(adress)


        vDetailsStackView.addArrangedSubview(emailView)
        vDetailsStackView.addArrangedSubview(phoneView)
        vDetailsStackView.addArrangedSubview(adressView)
    }
    
    fileprivate func setupConstraints() {
        // add constraints to subviews
        var constraints = [NSLayoutConstraint]()

        //MARK : vStackView
        constraints += [NSLayoutConstraint.init(item: vStackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 107)]  //top
        constraints += [NSLayoutConstraint.init(item: vStackView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 35)] //leading

        //MARK : profil
        constraints += [NSLayoutConstraint.init(item: profil, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 90)] // .top
        constraints += [NSLayoutConstraint.init(item: profil, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -26)] //.trailing
        constraints += [NSLayoutConstraint.init(item: profil, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 78)] //.width
        constraints += [NSLayoutConstraint.init(item: profil, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 78)] //.height

        //MARK : line
        constraints += [NSLayoutConstraint.init(item: line, attribute: .top, relatedBy: .equal, toItem: profil, attribute: .bottom, multiplier: 1.0, constant: 36)] // .top
        constraints += [NSLayoutConstraint.init(item: line, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)] //.trailing
        constraints += [NSLayoutConstraint.init(item: line, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 100)] //.leading
        constraints += [NSLayoutConstraint.init(item: line, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1)] //.height

        //MARK : vDetailsStackView
        constraints += [NSLayoutConstraint.init(item: vDetailsStackView, attribute: .top, relatedBy: .equal, toItem: line, attribute: .bottom, multiplier: 1.0, constant: 40)] // .top
        constraints += [NSLayoutConstraint.init(item: vDetailsStackView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)] //.trailing
        constraints += [NSLayoutConstraint.init(item: vDetailsStackView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)] //.leading

        //MARK : emailView
        constraints += [NSLayoutConstraint.init(item: emailView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 67)] //.height

        //MARK : emailIcon
        constraints += [NSLayoutConstraint.init(item: emailIcon, attribute: .centerY, relatedBy: .equal, toItem: emailView, attribute: .centerY, multiplier: 1.0, constant: 0)] // .centerY
        constraints += [NSLayoutConstraint.init(item: emailIcon, attribute: .leading, relatedBy: .equal, toItem: emailView, attribute: .leading, multiplier: 1.0, constant: 20)] //.leading
        constraints += [NSLayoutConstraint.init(item: emailIcon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)] //.width

        //MARK : emailBackgroundView
        constraints += [NSLayoutConstraint.init(item: emailBackgroundView, attribute: .top, relatedBy: .equal, toItem: emailView, attribute: .top, multiplier: 1.0, constant: 0)] // .top
        constraints += [NSLayoutConstraint.init(item: emailBackgroundView, attribute: .trailing, relatedBy: .equal, toItem: emailView, attribute: .trailing, multiplier: 1.0, constant: 0)] //.trailing
        constraints += [NSLayoutConstraint.init(item: emailBackgroundView, attribute: .leading, relatedBy: .equal, toItem: emailIcon, attribute: .trailing, multiplier: 1.0, constant: 20)] //.leading
        constraints += [NSLayoutConstraint.init(item: emailBackgroundView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 67)] //.height

        //MARK : email
        constraints += [NSLayoutConstraint.init(item: email, attribute: .centerX, relatedBy: .equal, toItem: emailBackgroundView, attribute: .centerX, multiplier: 1.0, constant: 0)] //.centerX
        constraints += [NSLayoutConstraint.init(item: email, attribute: .centerY, relatedBy: .equal, toItem: emailBackgroundView, attribute: .centerY, multiplier: 1.0, constant: 0)] //.centerY


        //MARK : phoneView
        constraints += [NSLayoutConstraint.init(item: phoneView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 67)] //.height
        constraints += [NSLayoutConstraint.init(item: phoneIcon, attribute: .centerY, relatedBy: .equal, toItem: phoneView, attribute: .centerY, multiplier: 1.0, constant: 0)] // .centerY
        constraints += [NSLayoutConstraint.init(item: phoneIcon, attribute: .leading, relatedBy: .equal, toItem: phoneView, attribute: .leading, multiplier: 1.0, constant: 20)] //.leading
        constraints += [NSLayoutConstraint.init(item: phoneIcon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)] //.width

        //MARK : phoneBackgroundView
        constraints += [NSLayoutConstraint.init(item: phoneBackgroundView, attribute: .top, relatedBy: .equal, toItem: phoneView, attribute: .top, multiplier: 1.0, constant: 0)] // .top
        constraints += [NSLayoutConstraint.init(item: phoneBackgroundView, attribute: .trailing, relatedBy: .equal, toItem: phoneView, attribute: .trailing, multiplier: 1.0, constant: 0)] //.trailing
        constraints += [NSLayoutConstraint.init(item: phoneBackgroundView, attribute: .leading, relatedBy: .equal, toItem: phoneIcon, attribute: .trailing, multiplier: 1.0, constant: 20)] //.leading
        constraints += [NSLayoutConstraint.init(item: phoneBackgroundView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 67)] //.height

        //MARK : phone
        constraints += [NSLayoutConstraint.init(item: phone, attribute: .centerX, relatedBy: .equal, toItem: phoneBackgroundView, attribute: .centerX, multiplier: 1.0, constant: 0)] //.centerX
        constraints += [NSLayoutConstraint.init(item: phone, attribute: .centerY, relatedBy: .equal, toItem: phoneBackgroundView, attribute: .centerY, multiplier: 1.0, constant: 0)] //.centerY


        //MARK : adressIcon
        constraints += [NSLayoutConstraint.init(item: adressIcon, attribute: .centerY, relatedBy: .equal, toItem: adressView, attribute: .centerY, multiplier: 1.0, constant: 0)] // .centerY
        constraints += [NSLayoutConstraint.init(item: adressIcon, attribute: .leading, relatedBy: .equal, toItem: adressView, attribute: .leading, multiplier: 1.0, constant: 20)] //.leading
        constraints += [NSLayoutConstraint.init(item: adressIcon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)] //.width


        //MARK : adressBackgroundView
        constraints += [NSLayoutConstraint.init(item: adressBackgroundView, attribute: .top, relatedBy: .equal, toItem: adressView, attribute: .top, multiplier: 1.0, constant: 0)] // .top
        constraints += [NSLayoutConstraint.init(item: adressBackgroundView, attribute: .trailing, relatedBy: .equal, toItem: adressView, attribute: .trailing, multiplier: 1.0, constant: 0)] //.trailing
        constraints += [NSLayoutConstraint.init(item: adressBackgroundView, attribute: .leading, relatedBy: .equal, toItem: adressIcon, attribute: .trailing, multiplier: 1.0, constant: 20)] //.leading
        constraints += [NSLayoutConstraint.init(item: adressBackgroundView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 67)] //.height

        //MARK : adressIcon
        constraints += [NSLayoutConstraint.init(item: adress, attribute: .centerX, relatedBy: .equal, toItem: adressBackgroundView, attribute: .centerX, multiplier: 1.0, constant: 0)] //.centerX
        constraints += [NSLayoutConstraint.init(item: adress, attribute: .centerY, relatedBy: .equal, toItem: adressBackgroundView, attribute: .centerY, multiplier: 1.0, constant: 0)] //.centerY


        self.addConstraints(constraints)
    }
    
    /// Reloading the data and update the ui according to the new data
    func reloadData() {
        self.object = dataSource?.objectFor(ui: self)
        name.text = "\(object!.first!) \(object!.last!)"
        city.text = "\(object!.zip!) \(object!.city!), \(object!.state!)"
        email.text = "\(object!.email!)"
        phone.text = "\(object!.phone!) / \(object!.cell!) "
        adress.text = "\(object!.street!)"
        profil.sd_setImage(with: URL.init(string: object!.large)) { (im, error, cacheType, url) in
        }
    }
}
