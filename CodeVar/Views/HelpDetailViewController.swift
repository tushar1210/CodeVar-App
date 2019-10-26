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
                titleLabel.text = ""
                break
            }
    }
    //MARK: - Submit Pressed
    @IBAction func submitTapped(_ sender: UIButton) {
        //write to Database
    }

    
    

    

}
