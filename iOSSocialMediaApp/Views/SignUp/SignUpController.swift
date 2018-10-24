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
		self.dismiss(animated: true, completion: nil)
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
		
		users.createUser(username: usernameText, email: emailText, password: passwordText) { (authResult, error) in
			if let error = error {
				print("Error: [FireAuth] in createUser() - \(error.localizedDescription)")
				self.showAlert(title: "Sign Up", message: error.localizedDescription)
				return
			}
			guard let user = authResult?.user else { return }
			print("User created: \(user)")
		}
	}
	
	private func showAlert(title: String, message: String) {
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
