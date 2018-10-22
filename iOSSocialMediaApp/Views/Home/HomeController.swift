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
	
	var tweets: [String] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tweets.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		let tweet = tweets[indexPath.row]
		let cell = tweetsTable.dequeueReusableCell(withIdentifier: "TweetCell") as! UITableViewCell
		
		return cell
	}
}