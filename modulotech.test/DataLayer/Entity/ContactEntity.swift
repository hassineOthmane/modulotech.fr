//
//  UserEntity.swift
//  modulotech.test
//
//  Created by hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit
import SwiftyJSON



struct Contact {
    var gender:String!
    var title:String!
    var last:String!
    var first:String!

    var street:String!
    var city:String!
    var state:String!
    var zip:String!

    var email:String!
    var username:String!
    var password:String!
    var phone:String!
    var cell:String!
    var SSN:String!

    var large:String!
    var medium:String!
    var thumbnail:String!

    init(element:[String:AnyObject]) {

        gender = element["gender"] as? String ?? "error"

        title = element["name"]?["title"] as? String ?? "error"
        last = element["name"]?["last"] as? String ?? "error"
        first = element["name"]?["first"] as? String ?? "error"

        street = element["location"]?["street"] as? String ?? "error"
        city = element["location"]?["city"] as? String ?? "error"
        state = element["location"]?["state"] as? String ?? "error"
        zip = element["location"]?["zip"] as? String ?? "error"

        email = element["email"] as? String ?? "error"
        username = element["username"] as? String ?? "error"
        password = element["password"] as? String ?? "error"
        cell = element["cell"] as? String ?? "error"
        phone = element["phone"] as? String ?? "error"
        SSN = element["SSN"] as? String ?? "error"

        large = element["picture"]?["large"] as? String ?? "error"
        medium = element["picture"]?["medium"] as? String ?? "error"
        thumbnail = element["picture"]?["thumbnail"] as? String ?? "error"

    }
    init(username:String,password:String) {
        self.username = username
        self.password = password
    }

    init(first:String,last:String, title:String,gender:String, street:String,city:String, state:String,zip:String, email:String ,phone:String, cell:String,SSN:String, medium:String, large:String,thumbnail:String  ) {
        self.first = first
        self.last = last
        self.title = title
        self.gender = gender

        self.street = street
        self.city = city
        self.state = state
        self.zip = zip

        self.email = email
        self.phone = phone
        self.cell = cell
        self.SSN = SSN

        self.medium = medium
        self.large = large
        self.thumbnail = thumbnail

    }

    init() {

    }

}

