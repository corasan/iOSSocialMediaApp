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

		Auth.emailAuth(email: emailText, password: passwordText) { (error) in
			self.showAlert(message: error)
		}
	}
}

extension LoginController {
	private func showAlert(message: String) {
		let alert = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		
		present(alert, animated: true)
	}
}
