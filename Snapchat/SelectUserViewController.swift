//
//  SelectUserViewController.swift
//  Snapchat
//
//  Created by Taylor Redding on 6/27/17.
//  Copyright © 2017 Taylor Redding. All rights reserved.
//

import UIKit
import Firebase

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        Database.database().reference().child("users").observe(DataEventType.childAdded, with: { (snapshot) in
            print(snapshot)
            
            let user = User()
            let snapshotValue = snapshot.value as! NSDictionary
            
            
            user.email = snapshotValue["email"] as! String
            user.uid = snapshot.key
            
            self.users.append(user)
            self.tableView.reloadData()
            
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = users[indexPath.row]
        
        Database.database().reference().child("users").child(user.uid).child("snaps").childByAutoId().setValue("testing 123")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
