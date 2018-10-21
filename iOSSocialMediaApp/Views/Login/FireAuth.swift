//
//  Auth.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/20/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import UIKit
import Firebase

class FireAuth {
	func emailAuth(email: String, password: String, alert: @escaping (String) -> Void) {
		if (email != "" && password != "") {
			Auth.auth().signIn(withEmail: email, password: password) { (authResult, err) in
				if let error = err {
					alert("Error: [FireAuth] in emailAuth() - \(error)")
					return
				}
			}
		} else {
			alert("Email and password field cannot be empty.")
		}
	}
}
