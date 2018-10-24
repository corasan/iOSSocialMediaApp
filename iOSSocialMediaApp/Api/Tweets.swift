//
//  Tweets.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/22/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import Firebase

class Tweets {
	var FS: Firestore!
	var TweetsDB: CollectionReference!
	var tweets: [Tweet] = []
	let user = Auth.auth().currentUser!
	
	init() {
		FS = Global.FS
		TweetsDB = FS.collection("users/\(user.uid)/tweets")
		
		print("User: \(user)")
	}
	
	func createTweet(text: String, userId: String) {
		TweetsDB.addDocument(data: [
			"text": text,
			"user_id": userId
		])
	}
	
	func listenForTweets(callback: @escaping ([Tweet]) -> Void) {
		TweetsDB.addSnapshotListener { (querySnapshot, error) in
			guard let documents = querySnapshot?.documents else {
				print("Error: [Tweets] in listenForTweets() - \(error!)")
				return
			}
			
			self.tweets = documents.map { self.newTweet(text: $0["text"] as! String, userId: $0["user_id"] as! String) }
			callback(self.tweets)
		}
	}
	
	private func newTweet(text: String, userId: String) -> Tweet {
		let tweet = Tweet(text: text, userId: userId)
		return tweet
	}
}
