//
//  Auth.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/20/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import Firebase

class Users {
	var user: User!
	var UserRef: DocumentReference!
	var FS: Firestore!
	
	init() {
		FS = Global.FS!
	}

	func createUser(username: String, email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
		if (username != "" || email != "" || password != "") {
			Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
				if (authResult != nil) {
					self.setUser(user: authResult!.user)
				}
				completion(authResult, error)
			}
		}
	}
	
	func emailAuth(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
		if (email != "" && password != "") {
			Auth.auth().signIn(withEmail: email, password: password) { (authResult, err) in
				if (authResult != nil) {
					Global.currentUser = authResult!.user
				}
				completion(authResult, err)
			}
		}
	}
	
	func updateDisplayName(displayName: String) {
		UserRef.updateData(["display_name": displayName]) { err in
			if let err = err {
				print("Error: [Users] in changeDisplayNameInDB() - \(err.localizedDescription)")
			} else {
				self.updateProfileDisplayName(displayName: displayName)
			}
		}
	}
	
	private func updateProfileDisplayName(displayName: String) {
		let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
		changeRequest?.displayName = displayName
		changeRequest?.commitChanges { (error) in
			if let error = error {
				print("Error: [Users] in updateDisplayName() - \(error.localizedDescription)")
			}
		}
	}
	
	private func setUser(user: User) {
		self.user = user
		Global.currentUser = user
		UserRef = FS.collection("users").document("\(user.uid)")
	}
}
