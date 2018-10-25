//
//  TweetCell.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/22/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import UIKit
import Firebase

class TweetCell: UITableViewCell {
	@IBOutlet weak var tweetText: UILabel!
	@IBOutlet weak var displayName: UILabel!
	@IBOutlet weak var username: UILabel!
	
	let user = Auth.auth().currentUser!
	var UsersDB: Users!
	
	func setTweet(tweet: Tweet) {
		tweetText.text = tweet.text
		displayName.text = user.displayName
		username.text = ""
		
		let FS = Global.FS
		let UsersDB = FS?.collection("users")
		
		UsersDB!.document(user.uid).getDocument { (document, error) in
			if let document = document, document.exists {
				let dataDescription = document.get("username")
				let username = dataDescription as? String
				self.username.text = username!
			}
		}
	}
}
