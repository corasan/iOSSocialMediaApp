//
//  Auth.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/20/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import Firebase

class Users {
	var UsersDB: CollectionReference!
	
	init() {
		let FS = Global.FS!
		UsersDB = FS.collection("users")
	}

	func createUser(username: String, email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
		Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
			guard let authResult = authResult else {
				print("Error: [Users] in createUser() - \(error!.localizedDescription)")
				return
			}
			Global.currentUser = authResult.user

			self.saveUserInDB(username: username, email: email, uid: authResult.user.uid)
			completion(authResult, error)
		}
	}
	
	func emailAuth(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
		Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
			guard let authResult = authResult else {
				print("Error: [Users] in emailAuth() - \(error!.localizedDescription)")
				return
			}

			Global.currentUser = authResult.user
			completion(authResult, error)
		}
	}
	
	func updateDisplayName(displayName: String, completion: @escaping () -> Void) {
		let user = Global.currentUser!

		UsersDB.document(user.uid).updateData(["display_name": displayName]) { err in
			if let err = err {
				print("Error: [Users] in changeDisplayNameInDB() - \(err.localizedDescription)")
			} else {
				self.updateProfileDisplayName(displayName: displayName)
				Global.userDisplayName = displayName
				completion()
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
	
	private func saveUserInDB(username: String, email: String, uid: String) {
		let newUser = UsersDB.document(uid)
		newUser.setData([
			"username": username,
			"email": email,
			"display_name": "",
			"user_id": uid
		])
	}
}
