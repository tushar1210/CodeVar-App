//
//  HelpDetailViewController.swift
//  CodeVar
//
//  Created by Poorna Chandra Vemula on 26/10/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SDWebImage

class HelpDetailViewController: UIViewController {

    //MARK: - Variables
    internal var buttonNumberPressed : Int = 0
    var profileImage = UserDefaults.standard.string(forKey: "profileImage") ?? ""
    var email = UserDefaults.standard.string(forKey: "email") ?? ""
    var newEmail : String!
    var sendToChild : String!
    //MARK: - Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var helpTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileImageView.sd_setImage(with: URL(string: profileImage ), placeholderImage: UIImage(named: "ankit"))
        newEmail = email.replacingOccurrences(of: ".", with: "_")
        setView()
   }
    //MARK: - Set View
    func setView() {
            submitButton.layer.cornerRadius = 10.0
            switch buttonNumberPressed {
            case 1:
                titleLabel.text = "Consumables team"
                sendToChild = "ConsumableTeam"
                break
            case 2:
                titleLabel.text = "CodePark related"
                sendToChild = "CodeparkRelated"
                break
            case 3:
                titleLabel.text = "Venue issues"
                sendToChild = "VenueIssues"
                break
            case 4:
                titleLabel.text = "Other"
                sendToChild = "Others"
                break
            default:
                titleLabel.text = "Error"
                break
            }
    }
    //MARK: - Submit Pressed
    @IBAction func submitTapped(_ sender: UIButton) {
        //UI setup
        helpTextField.endEditing(true)
        helpTextField.isEnabled = false
        submitButton.isEnabled = false
          
        //write to Database
        let helpDB = Database.database().reference().child(sendToChild)
        let helpDictionary = ["Sender": newEmail, "Message" : helpTextField.text!]
        helpDB.childByAutoId().setValue(helpDictionary) {
            (error, reference) in
            if error != nil {
                print(error)
            }
            else{
                print("Message saved Successfully!")
                self.showAlert()
            }
            self.helpTextField.isEnabled = true
            self.submitButton.isEnabled = true
            self.helpTextField.text = ""
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "", message: "Issue Reported!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Hide the Keyboard when tapped anyehere else
       override func touchesBegan(_ touches: Set<UITouch>,with event: UIEvent?) {
           self.view.endEditing(true)
       }
}
