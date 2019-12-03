//
//  CustomNavigationController.swift
//  CodeVar
//
//  Created by Poorna Chandra Vemula on 03/12/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
             // Custom Nav Bar setting the image to NIL
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
    



}
