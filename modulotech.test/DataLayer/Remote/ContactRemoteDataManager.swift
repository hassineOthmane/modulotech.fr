//
//  UserRemoteDataManager.swift
//  modulotech.test
//
//  Created by hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ContactRemoteDataManagerProtocol: class {
    func signIn(user:SignInEntity, _ callBack:@escaping (Contact?,String?) -> Void)
    func  fetchContacts( _ callBack: @escaping ([Contact],String?) -> Void)
}

class ContactRemoteDataManager: ContactRemoteDataManagerProtocol {

    func  signIn(user: SignInEntity, _ callBack: @escaping (Contact?,String?) -> Void) {
        Alamofire.request("http://www.storage42.com/contacts.json").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                var json = JSON(responseData.result.value!)
                let resData = json["me"].object
                let element = resData as? [String:AnyObject] ?? nil
                if(element != nil)
                {
                    let u = Contact.init(element:element!)
                    if(user.password ==  u.password && user.username ==  u.username)
                    {
                        callBack(u,nil)
                    }
                    else
                    {
                        callBack(nil,"a wrong username or wrong password")
                    }
                }
                else
                {
                    callBack(nil,"Http error")
                }
            }
            else
            {
                callBack(nil,"Http error")
            }
        }
    }

    func  fetchContacts( _ callBack: @escaping ([Contact],String?) -> Void) {
        var contacts = [Contact]()
        Alamofire.request("http://www.storage42.com/contacts.json").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                var json = JSON(responseData.result.value!)
                let resData = json["contacts"].arrayObject
                let arrayRes = resData as? [[String:AnyObject]] ?? nil
                if(arrayRes != nil)
                {

                    for element in arrayRes!
                    {
                        contacts.append(Contact.init(element:element))
                    }
                    callBack(contacts,nil)
                }
                else
                {
                    callBack(contacts,"Http error")
                }
            }
            else
            {
                callBack(contacts,"Http error")
            }
        }
    }
}
