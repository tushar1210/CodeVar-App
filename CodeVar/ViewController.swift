//
//  ViewController.swift
//  CodeVar
//
//  Created by Tushar Singh on 09/10/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import Canvas
import MBCircularProgressBar

let date = Date()
let calander = Calendar.current
let hour = calander.component(.hour, from: date)
let minute = calander.component(.minute, from: date)
//let second = calander.component(.second, from: date)
let day = calander.component(.day, from: date)
let month = calander.component(.month, from: date)
let eventTime = "\(hour):\(minute)"
let eventDate = "\(day):\(month)"


class ViewController: UIViewController {
    
    let MAXTIME : Float = 100.0
    var currentTime : Float = 0.0
    var arr = ["Profile","About Us","Policy"]
    var iconArr = ["profile","about","policy"]

    @IBOutlet weak var progressView: MBCircularProgressBarView!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var next1Label: UILabel!
    @IBOutlet weak var next2Label: UILabel!
    @IBOutlet weak var next3Label: UILabel!
    @IBOutlet weak var time1Label: UILabel!
    @IBOutlet weak var time2Label: UILabel!
    @IBOutlet weak var time3Label: UILabel!
    @IBOutlet weak var profileBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileBttn.layer.cornerRadius = 13
        profileBttn.clipsToBounds = true
        self.progressView.value = 0
        self.progressView.maxValue = CGFloat(MAXTIME)
        
    }
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1){
            self.updateProgress()
        }
    }
    
    @objc func updateProgress(){
        
        if eventTime >= "\(8):\(00)" && eventTime <= "\(12):\(00)"  && eventDate == "\(12):\(10)" {
            currentLabel.text = "Snacks"
            next1Label.text = "Snacks"
            next2Label.text = "Round1"
            next3Label.text = "Round2"
            time1Label.text = "07:00 AM"
            time2Label.text = "07:00 AM"
            time3Label.text = "07:00 AM"
            //self.roundsCollectionView.scrollToItem(at: IndexPath(item: 01, section: 1), at: .centeredVertically, animated: true)
            self.progressView.value = 15
            self.progressView.progressColor = UIColor(red:0.95, green:0.15, blue:0.07, alpha:1.0)
            self.progressView.progressStrokeColor = UIColor(red:0.95, green:0.15, blue:0.07, alpha:1.0)
        }
        if eventTime >= "\(12):\(01)" && eventTime <= "\(15):\(00)"  && eventDate == "\(12):\(10)" {
            currentLabel.text = "Round 1"
            next1Label.text = "Round 2"
            next2Label.text = "Round 3"
            next3Label.text = "Round 4"
            time1Label.text = "07:00 AM"
            time2Label.text = "07:00 AM"
            time3Label.text = "07:00 AM"
            self.progressView.value = 30
            self.progressView.progressColor = UIColor(red:0.43, green:0.84, blue:0.93, alpha:1.0)
            self.progressView.progressStrokeColor = UIColor(red:0.43, green:0.84, blue:0.93, alpha:1.0)
        }
        if eventTime >= "\(15):\(01)" && eventTime <= "\(18):\(00)"  && eventDate == "\(12):\(10)" {
            currentLabel.text = "Round 2"
            next1Label.text = "Round 2"
            next2Label.text = "Round 3"
            next3Label.text = "Round 4"
            time1Label.text = "07:00 AM"
            time2Label.text = "07:00 AM"
            time3Label.text = "07:00 AM"
            self.progressView.value = 50
        }
        if eventTime >= "\(18):\(01)" && eventTime <= "\(22):\(00)"  && eventDate == "\(12):\(10)" {
            currentLabel.text = "Round 3"
            next1Label.text = "Round 3"
            next2Label.text = "Round 4"
            next3Label.text = "Round 5"
            time1Label.text = "07:00 AM"
            time2Label.text = "07:00 AM"
            time3Label.text = "07:00 AM"
            self.progressView.value = 80
        }
        if eventTime >= "\(22):\(01)" && eventTime <= "\(7):\(00)"  && eventDate == "\(12):\(10)" {
            currentLabel.text = "Round 4"
            next1Label.text = "Round 4"
            next2Label.text = "Round 5"
            next3Label.text = "Round 6"
            time1Label.text = "07:00 AM"
            time2Label.text = "07:00 AM"
            time3Label.text = "07:00 AM"
            self.progressView.value = 100
        }
    }


}

