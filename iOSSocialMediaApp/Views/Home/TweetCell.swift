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
	
	let user = Auth.auth().currentUser!
	
	func setTweet(tweet: Tweet) {
		tweetText.text = tweet.text
	}
}
