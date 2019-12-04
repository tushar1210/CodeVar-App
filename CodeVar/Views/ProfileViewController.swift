//
//  profileViewController.swift
//  CodeVar
//
//  Created by ANKIT YADAV on 12/10/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProfileViewController: UIViewController {

    var url = "https://api.codepark.in/u/basic"
    var profileImage = UserDefaults.standard.string(forKey: "profileImage") ?? ""
    var username = UserDefaults.standard.string(forKey: "username") ?? ""
    var fullName = UserDefaults.standard.string(forKey: "fullName") ?? ""
    var cookie = UserDefaults.standard.string(forKey: "cookie") ?? ""
    var token : String!
      
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var helpfulnessLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var activenessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        token = "Bearer "+cookie
        let headers = [
            "Authorization": "Bearer "+cookie
        ]
        getData(headers : headers)
        setView()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    
    
    func setView() {
        profileImageView.sd_setImage(with: URL(string: profileImage ), placeholderImage: UIImage(named: "ankit"))
        usernameLabel.text = username
        fullNameLabel.text = fullName
    }
    
    func getData(headers : [String : String]) {
   
        Alamofire.request(url, method: .get, headers: headers).responseJSON {
            
            response in
            if response.result.isSuccess {
                print("success")
                print(response)
                let responseJSON : JSON = JSON(response.result.value!)
                self.updateUI(json : responseJSON)
           }
            else
            {
                print("Error \(response.result.error)")
            }
        }
        
    }
    
    func updateUI(json : JSON) {
        levelLabel.text = json["userData"]["stats"]["level"].stringValue
        helpfulnessLabel.text = json["userData"]["stats"]["helpfulness"].stringValue
        intelligenceLabel.text = json["userData"]["stats"]["intelligence"].stringValue
        activenessLabel.text = json["userData"]["stats"]["activeness"].stringValue
    }
    

    
}
