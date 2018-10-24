//
//  DisplayNameController.swift
//  iOSSocialMediaApp
//
//  Created by Henry Paulino on 10/24/18.
//  Copyright © 2018 Henry Paulino. All rights reserved.
//

import UIKit
import Firebase

class DisplayNameController: UIViewController {
	@IBOutlet weak var name: UITextField!
	
	var UsersDB: Users!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		UsersDB = Users()
	}
	
	@IBAction func doneBtn(_ sender: Any) {
		done()
	}
}

extension DisplayNameController {
	private func done() {
		let nameText = name.text!

		UsersDB.updateDisplayName(displayName: nameText) { () in
			self.navigateToMainView()
		}
	}
	
	private func navigateToMainView() {
		let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let displayNameNavigation = mainStoryBoard.instantiateViewController(withIdentifier: "MainView") as UIViewController
		
		present(displayNameNavigation, animated: true, completion: nil)
	}
}
