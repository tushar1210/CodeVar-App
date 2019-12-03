//
//  AppDelegate.swift
//  CodeVar
//
//  Created by Tushar Singh on 09/10/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        //check if already logged in
        if UserDefaults.standard.object(forKey: "username") != nil {
            //logged in
            self.GoToMain()
            
        } else {
            //not logged in
            self.GoToLogin()
           
        }
        
        return true
    }
    
    func GoToMain(){
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBar") as! UITabBarController

        self.window?.rootViewController = mainView
    }
    
    func GoToLogin(){
        let loginView =   UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        self.window?.rootViewController = loginView
    }


}

