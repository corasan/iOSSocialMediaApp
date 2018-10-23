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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	
	@IBAction func backBtn(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}

	@IBAction func signUpBtn(_ sender: Any) {
	}
}

extension SignUpController {
	
}
