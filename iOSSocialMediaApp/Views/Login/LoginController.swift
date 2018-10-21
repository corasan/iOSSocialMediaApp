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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	
	
	@IBAction func loginBtn(_ sender: Any) {
		let emailText = email.text!
		let passwordText = password.text!
		emailAuth(email: emailText, password: passwordText)
	}
	
	private func emailAuth(email: String, password: String) {
		if (email != "" && password != "") {
			Auth.auth().signIn(withEmail: email, password: password) { (authResult, err) in
				if let error = err {
					print("Error message: \(error)")
					return
				}
				print("Logged in!")
			}
		} else {
			print("Email and password field cannot be empty.")
		}
	}
}
