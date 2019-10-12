//
//  NotificationViewController.swift
//  CodeVar
//
//  Created by Poorna Chandra Vemula on 12/10/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import FirebaseDatabase

class NotificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var notificationArray = [NotificationData]()
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        setView()
        ref = Database.database().reference()
        retrieveNotifications()
    }
    
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
        
        let notifDB = ref.child("Notifications")
               
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
