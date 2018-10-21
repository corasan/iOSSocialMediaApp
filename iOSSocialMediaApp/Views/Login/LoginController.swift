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
	
	let Auth = FireAuth()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	
	
	@IBAction func loginBtn(_ sender: Any) {
		let emailText = email.text!
		let passwordText = password.text!

		Auth.emailAuth(email: emailText, password: passwordText) { (authResult, error) in
			if let error = error {
				self.showAlert(title: "Login", message: "Error: [FireAuth] in emailAuth() - \(error)")
				return
			}
			self.navigateToMainView()
		}
	}
}

extension LoginController {
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
