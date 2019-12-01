//
//  LoginViewController.swift
//  CodeVar
//
//  Created by ANKIT YADAV on 13/10/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBttn: UIButton!
    
    var url = "https://api.codepark.in/auth/verifyUser"
    let userDataModel = userData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBttn.layer.cornerRadius = 10
        //Hide Keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    // MARK: - Code below this is for hiding keyboard

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func hideKeyboard(){
        passwordField.resignFirstResponder()
    }
    @objc func keyboardwilchange(notification: Notification){
        print("Keyboard will show: \(notification.name.rawValue)")
        view.frame.origin.y = -270
    }
    
    //UITextFieldDeligate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return Pressed")
        hideKeyboard()
        return true
    }
    //Hide when touch outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        view.frame.origin.y = 0
    }
    
    // MARK:-
    
    
    @IBAction func LoginTapped(_ sender: UIButton) {
        
        let params : [String : String] = ["email" : emailField.text! ,"password" : passwordField.text!]
        VerifyUser(url: url, parameters: params)
        
        
    }
    
    func VerifyUser(url: String, parameters : [String : String]) {
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON {
             
             response in
             if response.result.isSuccess {
                 print("success! posted data")
                 print(response)
                 let responseJSON : JSON = JSON(response.result.value!)
                 self.Auth(json: responseJSON)
            }
             else
             {
                 print("Error \(response.result.error)")
             }
         }
        
    }
    
    func Auth(json : JSON) {
        let code = json["code"].intValue
        let message = json["message"].stringValue
        if code == 0 {
            updateUserData(json: json)
            performSegue(withIdentifier: "goToHome", sender: nil)
        }
        else if code == 1 {
            print(message)
            emailField.text = ""
            passwordField.text = ""
        }
    }
    
    func updateUserData(json : JSON) {
        
        userDataModel.firstName = json["userData"]["name"]["firstName"].stringValue
        userDataModel.lastName  = json["userData"]["name"]["lastName"].stringValue
        userDataModel.fullName  = json["userData"]["name"]["fullName"].stringValue
        userDataModel.username = json["userData"]["username"].stringValue
        userDataModel.uid = json["userData"]["uid"].stringValue
        userDataModel.profileImage = json["userData"]["profile_image"].stringValue
        
        UserDefaults.standard.set(userDataModel.profileImage , forKey: "profileImage")
        UserDefaults.standard.set(userDataModel.username , forKey: "username")
        UserDefaults.standard.set(userDataModel.fullName , forKey: "fullName")
        
    }
    
    
}
