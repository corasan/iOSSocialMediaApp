//
//  TweetCell.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/22/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
	@IBOutlet weak var tweetText: UILabel!
	
	func setTweet(tweet: Tweet) {
		tweetText.text = tweet.text
	}
}
