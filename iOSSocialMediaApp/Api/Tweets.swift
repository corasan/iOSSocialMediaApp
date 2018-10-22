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
	var tweets: [String] = []
	
	init() {
		let settings = FirestoreSettings()
		Firestore.firestore().settings = settings
		FS = Firestore.firestore()
		TweetsDB = FS.collection("Tweets")
		
		listenForTweets()
	}

	func getTweets() -> [String] {
		return tweets
	}
	
	func createTweet(text: String, userId: String) {
		TweetsDB.addDocument(data: [
			"text": text,
			"user_id": userId
		])
	}
	
	private func listenForTweets() {
		TweetsDB.addSnapshotListener { (querySnapshot, error) in
			guard let documents = querySnapshot?.documents else {
				print("Error: [Tweets] in listenForTweets() - \(error!)")
				return
			}
			
			self.tweets = documents.map { $0["text"] as! String }
		}
	}
}
