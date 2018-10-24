//
//  SignUpController.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/23/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
	@IBOutlet weak var username: UITextField!
	@IBOutlet weak var email: UITextField!
	@IBOutlet weak var password: UITextField!
	
	var users: Users!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		users = Users()
	}
	
	@IBAction func backBtn(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}

	@IBAction func signUpBtn(_ sender: Any) {
		signUp()
	}
}

extension SignUpController {
	private func signUp() {
		let usernameText = self.username.text!
		let emailText = self.email.text!
		let passwordText = self.password.text!
		
		if (usernameText != "" && emailText != "" && passwordText != "") {
			users.createUser(username: usernameText, email: emailText, password: passwordText) { (authResult, error) in
				guard let user = authResult?.user else {
					print("Error: [FireAuth] in createUser() - \(error!.localizedDescription)")
					self.showAlert(message: error!.localizedDescription)
					return
				}

				print("User created: \(user)")
				self.navigateToDisplayName()
			}
		} else {
			self.showAlert(message: "Text fields cannot be empty.")
		}
	}
	
	private func showAlert(message: String) {
		let alert = UIAlertController(title: "Sign Up", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		
		present(alert, animated: true)
	}
	
	private func navigateToDisplayName() {
		let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let displayNameNavigation = mainStoryBoard.instantiateViewController(withIdentifier: "SetDisplayNameView") as UIViewController
		
		present(displayNameNavigation, animated: true, completion: nil)
	}
}
