//
//  Tweet.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/22/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

class Tweet {
	var text: String
	var user_id: String
	
	init(text: String, userId: String) {
		self.text = text
		self.user_id = userId
	}
}
