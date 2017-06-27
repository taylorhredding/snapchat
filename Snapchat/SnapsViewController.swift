//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Taylor Redding on 6/26/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
