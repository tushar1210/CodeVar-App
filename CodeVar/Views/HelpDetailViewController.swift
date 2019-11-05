//
//  HelpDetailViewController.swift
//  CodeVar
//
//  Created by Poorna Chandra Vemula on 26/10/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HelpDetailViewController: UIViewController {

    //MARK: - Variables
    internal var buttonNumberPressed : Int = 0
    //MARK: - Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var helpTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setView()
   }
    //MARK: - Set View
    func setView() {
            submitButton.layer.cornerRadius = 10.0
            switch buttonNumberPressed {
            case 1:
                titleLabel.text = "Consumables team"
                break
            case 2:
                titleLabel.text = "CodePark related"
                break
            case 3:
                titleLabel.text = "Venue issues"
                break
            case 4:
                titleLabel.text = "Other"
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
        let helpDB = Database.database().reference().child(titleLabel.text!)
        let helpDictionary = ["Sender": "test", "Message" : helpTextField.text!]
        helpDB.childByAutoId().setValue(helpDictionary) {
            (error, reference) in
            if error != nil {
                print(error)
            }
            else{
                print("Message saved Successfully!")
            }
            self.helpTextField.isEnabled = true
            self.submitButton.isEnabled = true
            self.helpTextField.text = ""
        }
    }
    //MARK: - Hide the Keyboard when tapped anyehere else
       override func touchesBegan(_ touches: Set<UITouch>,with event: UIEvent?) {
           self.view.endEditing(true)
       }
}
