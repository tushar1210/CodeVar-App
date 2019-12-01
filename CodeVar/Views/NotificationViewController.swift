//
//  NotificationViewController.swift
//  CodeVar
//
//  Created by Poorna Chandra Vemula on 12/10/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SDWebImage

class NotificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //MARK: - Variables
    var notificationArray = [NotificationData]()
    var profileImage = UserDefaults.standard.string(forKey: "profileImage") ?? ""
    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.sd_setImage(with: URL(string: profileImage ), placeholderImage: UIImage(named: "ankit"))
        tableView.delegate = self
        tableView.dataSource = self
        setView()
        retrieveNotifications()
    }
    //MARK: - Set View
    func setView() {
        tableView.rowHeight = 70.0
    }
    // MARK: - TableView Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! NotificationTableViewCell
        cell.messageLabel.text = notificationArray[indexPath.row].message
        cell.timeLabel.text = notificationArray[indexPath.row].time
        cell.backgroundColor = UIColor.clear
        return cell
    }
    // MARK: - Retrieve Notifications
    func retrieveNotifications() {
        
        let notifDB = Database.database().reference().child("Notifications")
               
        notifDB.observe(.childAdded) { (snapshot) in
                   
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            let notification = NotificationData()
                
            if let message = snapshotValue["message"] {
                notification.message = message
            }
            if let date = snapshotValue["date"] {
                notification.date = date
            }
            if let time = snapshotValue["time"] {
                notification.time = time
            }
                   
            self.notificationArray.append(notification)
                   
            self.tableView.reloadData()
        }
    }
}
