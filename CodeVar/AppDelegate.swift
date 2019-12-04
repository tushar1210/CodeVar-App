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
        
        Thread.sleep(forTimeInterval: 1.5)
        
        return true
    }
    
}

