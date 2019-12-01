//
//  ConsumableView.swift
//  CodeVar
//
//  Created by Poorna Chandra Vemula on 26/10/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit

class ConsumableView: UIViewController {

    //MARK: - Variables
    var profileImage = UserDefaults.standard.string(forKey: "profileImage") ?? ""
    var username = UserDefaults.standard.string(forKey: "username") ?? ""
    private var qrcodeImage: CIImage!
    //MARK: - IBoutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var qrImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileImageView.sd_setImage(with: URL(string: profileImage ), placeholderImage: UIImage(named: "ankit"))
        qrImageView.image = generateQRCode(from: username)
        setView()
    }
    //MARK: - Set View
    func setView() {
        qrImageView.layer.borderWidth = 2
        qrImageView.layer.borderColor = UIColor(red:244.0 , green:246.0 , blue: 248.0, alpha: 1.0).cgColor
    }
    // MARK:- Generating QR ImageView
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
}
