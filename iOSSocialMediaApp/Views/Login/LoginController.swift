//
//  LoginController.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/20/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
	@IBOutlet weak var email: UITextField!
	@IBOutlet weak var password: UITextField!
	
	var UsersDB: Users!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		UsersDB = Users()
	}
	
	
	@IBAction func loginBtn(_ sender: Any) {
		login()
	}
}

extension LoginController {
	private func login() {
		let emailText = email.text!
		let passwordText = password.text!
		
		if (emailText != "" && passwordText != "") {
			UsersDB.emailAuth(email: emailText, password: passwordText) { (authResult, error) in
				if let error = error {
					print("Error: [FireAuth] in emailAuth() - \(error.localizedDescription)")
					self.showAlert(message: error.localizedDescription)
					return
				}
				Global.userDisplayName = authResult!.user.displayName
				self.navigateToMainView()
			}
		} else {
			self.showAlert(message: "Text fields cannot be empty.")
		}
	}

	private func showAlert(message: String) {
		let alert = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		
		present(alert, animated: true)
	}
	
	private func navigateToMainView() {
		let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
		guard let mainNavigation = mainStoryBoard.instantiateViewController(withIdentifier: "MainView") as?
			UITabBarController else {
				return
		}
		
		present(mainNavigation, animated: true, completion: nil)
	}
}
