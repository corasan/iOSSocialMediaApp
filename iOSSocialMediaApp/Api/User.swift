//
//  Auth.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/20/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import Firebase

class User {
	func emailAuth(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
		if (email != "" && password != "") {
			Auth.auth().signIn(withEmail: email, password: password) { (authResult, err) in
				completion(authResult, err)
			}
		}
	}
}
