//
//  TabController.swift
//  modulotech.test
//
//  Created by hassine othmane on 1/15/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

class TabController: UIViewController {

     let tabBarCnt = UITabBarController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.backgroundColor
        UITabBar.appearance().barTintColor = Colors.backgroundColor
        tabBarCnt.tabBar.backgroundColor = Colors.backgroundColor
        tabBarCnt.tabBar.tintColor = UIColor.white
        tabBarCnt.tabBar.isTranslucent = false
        let contactModule = UINavigationController.init(rootViewController: ContactView()) 
        contactModule.tabBarItem =  UITabBarItem.init(title: "", image: UIImage.init(named: "contacts-icon"), tag: 1)
        let profilModule = ProfilView()
        profilModule.tabBarItem =  UITabBarItem.init(title: "", image: UIImage.init(named: "profil_icon"), tag: 1)
        let aboutView = AboutView()
        aboutView.tabBarItem =  UITabBarItem.init(title: "", image: UIImage.init(named: "about_icon"), tag: 1)
        tabBarCnt.viewControllers = [contactModule,profilModule,aboutView]
        self.view.addSubview(tabBarCnt.view)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       self.navigationController?.isNavigationBarHidden = true

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
