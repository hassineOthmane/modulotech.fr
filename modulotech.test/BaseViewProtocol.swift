//
//  BaseViewProtocol.swift
//  modulotech.test
//
//  Created hassine othmane on 1/16/19.
//  Copyright © 2019 modulotech.fr. All rights reserved.
//

import UIKit

/// The base protocol for all view protocols, it contains the common functions
protocol BaseViewProtocol: class {

    var viewController : UIViewController { get }

  /// Show a loading view in the view controller
  func startLoading()

	/// Dismiss the loading view from the view controller
  func stopLoading()

	/// Set Navigation Bar Title for Current View.
	func setNavigationBarTitleWith(_ title: String)

	/// Get the module view to act as a UIViewController
	var asViewController: UIViewController { get }
}


// MARK: - the base protocol default implementation where the class is a subclass of a UIViewController
extension BaseViewProtocol where Self: UIViewController {

	/// Get the module view to act as a UIViewController
	var asViewController: UIViewController {
		return self
	}

	/// Set Navigation Bar Title for Current View.
	func setNavigationBarTitleWith(_ title: String) {
		self.title = title
	}

  func startLoading() {
    let window :UIWindow = UIApplication.shared.keyWindow!
    JustHUD.shared.showInWindow(window: window)
  }

  func stopLoading() {
    JustHUD.shared.hide()
  }

    var viewController : UIViewController {
        return self
    }


}
