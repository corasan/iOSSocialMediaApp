//
//  Auth.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/20/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import Firebase

class Users {
	var user: User?

	init() {
		user = Global.currentUser
	}

	func createUser(username: String, email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
		if (username != "" || email != "" || password != "") {
			Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
				completion(authResult, error)
			}
		}
	}
	
	
	func emailAuth(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
		if (email != "" && password != "") {
			Auth.auth().signIn(withEmail: email, password: password) { (authResult, err) in
				completion(authResult, err)
			}
		}
	}
	
	func changeDisplayName(displayName: String) {
		let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
		changeRequest?.displayName = displayName
		changeRequest?.commitChanges { (error) in
			if let error = error {
				print("Error: [Users] in changeDisplayName() - \(error.localizedDescription)")
			}
		}
	}
}
