//
//  HelpView.swift
//  CodeVar
//
//  Created by Poorna Chandra Vemula on 26/10/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import SDWebImage

class HelpView: UIViewController {

    //MARK: - Variables
    var buttonNumber : Int = 0
    var profileImage = UserDefaults.standard.string(forKey: "profileImage") ?? ""
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.sd_setImage(with: URL(string: profileImage ), placeholderImage: UIImage(named: "ankit"))
    }
    //MARK: - IBAction for Buttons
    @IBAction func consumablesTapped(_ sender: UIButton) {
        buttonNumber = 1
        performSegue(withIdentifier: "goToHelpDetail", sender: nil)
    }
    @IBAction func codeparkTapped(_ sender: UIButton) {
        buttonNumber = 2
        performSegue(withIdentifier: "goToHelpDetail", sender: nil)
    }
    @IBAction func venueTapped(_ sender: UIButton) {
        buttonNumber = 3
        performSegue(withIdentifier: "goToHelpDetail", sender: nil)
    }
    @IBAction func otherTapped(_ sender: UIButton) {
        buttonNumber = 4
        performSegue(withIdentifier: "goToHelpDetail", sender: nil)
    }
    //MARK: - Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHelpDetail"{
            let destinationVC = segue.destination as! HelpDetailViewController
            destinationVC.buttonNumberPressed = buttonNumber
        }
    }
}
