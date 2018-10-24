//
//  FirstViewController.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/20/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
	@IBOutlet weak var tweetsTable: UITableView!

	var tweets: [Tweet] = []
	var TweetsDB: Tweets!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		tweetsTable.tableFooterView = UIView()
		TweetsDB = Tweets()

		TweetsDB.listenForTweets { tweetsData in
			for i in tweetsData {
				self.tweets.append(i)
				self.updateTable()
			}
		}
	}
	
	private func updateTable() {
		let indexPath = IndexPath(row: tweets.count - 1, section: 0)
		
		tweetsTable.beginUpdates()
		tweetsTable.insertRows(at: [indexPath], with: .fade)
		tweetsTable.endUpdates()
	}
}

extension HomeController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tweets.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tweet = tweets[indexPath.row]
		let cell = tweetsTable.dequeueReusableCell(withIdentifier: "TweetCell") as! TweetCell
		cell.setTweet(tweet: tweet)

		return cell
	}
}
