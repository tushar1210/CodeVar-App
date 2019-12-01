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
import SDWebImage

//MARK:- DATE AND TIME variables defined globally.

let date = Date()
let calander = Calendar.current
let hour = calander.component(.hour, from: date)
let minute = calander.component(.minute, from: date)
let day = calander.component(.day, from: date)
let month = calander.component(.month, from: date)
let eventTime = "\(hour):\(minute)"
let eventDate = "\(day):\(month)"

let day1 = "\(30):\(10)" // 15 Oct
let day2 = "\(31):\(10)"

let pm7 = "\(19):\(00)"  // 07PM
let pm9 = "\(21):\(00)"  // 09PM
let am12 = "\(00):\(00)"  // 12AM
let am2 = "\(02):\(00)"  // 02AM
let am6 = "\(06):\(00)"  // 06AM
let am9 = "\(09):\(00)"  // 09AM
let am10 = "\(10):\(00)"  // 10AM
let pm1 = "\(13):\(00)"  // 01PM
let pm3 = "\(15):\(00)"  // 03PM
let pm6 = "\(18):\(00)" // 06PM
let pm8 = "\(20):\(00)" // 08PM

//MARK:-

class TimelineViewController: UIViewController {
    
    var profileImage = UserDefaults.standard.string(forKey: "profileImage") ?? ""
    let MAXTIME : Float = 100.0
    var currentTime : Float = 0.0
    
    var time = 0
    //timer
    var timer = Timer()
    func timerstart(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimelineViewController.action), userInfo: nil, repeats: true)
        //
        //(TimeInterval: 1,target: self, Selector: #selector(TimelineViewController.action), userInfo: nil, repeats: true)
    }
    @objc func action()
    {
        time += 1
        timerLabel.text = String(time)
    }

    @IBOutlet weak var progressView: MBCircularProgressBarView!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var next1Label: UILabel!
    @IBOutlet weak var next2Label: UILabel!
    @IBOutlet weak var next3Label: UILabel!
    @IBOutlet weak var time1Label: UILabel!
    @IBOutlet weak var time2Label: UILabel!
    @IBOutlet weak var time3Label: UILabel!
    @IBOutlet weak var profileBttn: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        timerstart()
        //updateLabels()
        updateLabels()
        profileBttn.layer.cornerRadius = 8
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
    
    //MARK:- code below is to update the progress Bar in the scene according to the time
    
   @objc func updateProgress(){
           
           if eventTime >= pm7 && eventTime < pm9  && eventDate == day1 { // 7pm to 9pm
               self.progressView.value = 8
               self.progressView.progressColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0) //yellow
               self.progressView.progressStrokeColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0)
           }
           if eventTime >= pm9 && eventTime < am12  && eventDate == day1 { // 9pm to 12am
               self.progressView.value = 20
               self.progressView.progressColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0) // skyblue
               self.progressView.progressStrokeColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0)

           }
           if eventTime >= am12 && eventTime < am2  && eventDate == day1 {  // 12am to 2am
               self.progressView.value = 28
               self.progressView.progressColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0) //yellow
               self.progressView.progressStrokeColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0)
           }
           if eventTime >= am2 && eventTime < am6  && eventDate == day1 {  // 2am to 6am
               self.progressView.value = 44
               self.progressView.progressColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0) //skyblue
               self.progressView.progressStrokeColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0)
           }
           if eventTime >= am6 && eventTime < am9  && eventDate == day1 {  // 6am to 9am
               self.progressView.value = 56
               self.progressView.progressColor = UIColor(red:0.64, green:0.00, blue:0.84, alpha:1.0) //purple
               self.progressView.progressStrokeColor = UIColor(red:0.64, green:0.00, blue:0.84, alpha:1.0)
           }
           if eventTime >= am9 && eventTime < am10  && eventDate == day1 {  // 9am to 10am
               self.progressView.value = 60
               self.progressView.progressColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0) //yellow
               self.progressView.progressStrokeColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0)
           }
           if eventTime >= am10 && eventTime < pm1  && eventDate == day1 {  // 10am to 1pm
               self.progressView.value = 72
               self.progressView.progressColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0) //skyblue
               self.progressView.progressStrokeColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0)
           }
           if eventTime >= pm1 && eventTime < pm3  && eventDate == day1 {  // 1pm to 3pm
               self.progressView.value = 80
               self.progressView.progressColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0) // yellow
               self.progressView.progressStrokeColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0)
           }
           if eventTime >= pm3 && eventTime < pm6  && eventDate == day1 {  // 3pm to 6pm
               self.progressView.value = 92
               self.progressView.progressColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0) // skyblue
               self.progressView.progressStrokeColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0)
           }
           if eventTime >= pm7 && eventTime < pm8  && eventDate == day2 {  // 7pm to 8pm
               self.progressView.value = 100
               self.progressView.progressColor = UIColor(red:0.64, green:0.00, blue:0.84, alpha:1.0) // purple
               self.progressView.progressStrokeColor = UIColor(red:0.64, green:0.00, blue:0.84, alpha:1.0)
           }
           
       }
       
       //MARK:- code below is to update the labels in the scene according to the time
       @objc func updateLabels(){
           if eventTime >= pm7 && eventTime < pm9  && eventDate == day1 {  // 7pm to 9pm
               currentLabel.text = "Arrival"
               next1Label.text = "Arrival"
               next2Label.text = "Round1"
               next3Label.text = "Pizza"
               time1Label.text = "07:00 PM"
               time2Label.text = "09:00 PM"
               time3Label.text = "12:00 AM"
           }
           if eventTime >= pm9 && eventTime < am12 && eventDate == day1 {  // 9pm to 12am
               currentLabel.text = "Round 1"
               next1Label.text = "Round 1"
               next2Label.text = "Pizza"
               next3Label.text = "Round 2"
               time1Label.text = "09:00 PM"
               time2Label.text = "12:00 AM"
               time3Label.text = "02:00 AM"
           }
           if eventTime >= am12 && eventTime < am2  && eventDate == day1 {  // 12am to 2am
               currentLabel.text = "Pizza"
               next1Label.text = "Pizza"
               next2Label.text = "Round 2"
               next3Label.text = "Giveaway"
               time1Label.text = "12:00 AM"
               time2Label.text = "02:00 AM"
               time3Label.text = "06:00 AM"
           }
           if eventTime >= am2 && eventTime < am6 && eventDate == day1 {  // 2am to 6am
               currentLabel.text = "Round 2"
               next1Label.text = "Round 2"
               next2Label.text = "Giveaway"
               next3Label.text = "Round 3"
               time1Label.text = "02:00 AM"
               time2Label.text = "06:00 AM"
               time3Label.text = "09:00 AM"
           }
           if eventTime >= am6 && eventTime < am9 && eventDate == day1 {  // 6am to 9am
               currentLabel.text = "Giveaway"
               next1Label.text = "Giveaway"
               next2Label.text = "Breakfast"
               next3Label.text = "Round 3"
               time1Label.text = "06:00 AM"
               time2Label.text = "09:00 AM"
               time3Label.text = "10:00 AM"
           }
           if eventTime >= am9 && eventTime < am10  && eventDate == day1 {  // 9am to 10am
               currentLabel.text = "Breakfast"
               next1Label.text = "Breakfast"
               next2Label.text = "Round 3"
               next3Label.text = "Lunch"
               time1Label.text = "09:00 AM"
               time2Label.text = "10:00 AM"
               time3Label.text = "01:00 pM"
           }
           if eventTime >= am10 && eventTime < pm1  && eventDate == day1 {  // 10am to 1pm
               currentLabel.text = "Round 3"
               next1Label.text = "Round 3"
               next2Label.text = "Lunch"
               next3Label.text = "Round 4"
               time1Label.text = "10:00 AM"
               time2Label.text = "01:00 PM"
               time3Label.text = "03:00 PM"
           }
           if eventTime >= pm1 && eventTime < pm3  && eventDate == day1 { // 1pm to 3pm
               currentLabel.text = "Lunch"
               next1Label.text = "Lunch"
               next2Label.text = "Round 4"
               next3Label.text = "Round 6"
               time1Label.text = "01:00 PM"
               time2Label.text = "03:00 PM"
               time3Label.text = "07:00 PM"
           }
           if eventTime >= pm3 && eventTime < pm6 && eventDate == day1 { // 3pm to 6pm
               currentLabel.text = "Round 4"
               next1Label.text = "Round 4"
               next2Label.text = "Closing ceremony"
               next3Label.text = ""
               time1Label.text = "03:00 PM"
               time2Label.text = "07:00 PM"
               time3Label.text = ""
           }
           if eventTime >= pm7 && eventTime < pm8 && eventDate == day2 { // 7pm to 8pm
               currentLabel.text = "All the best"
               next1Label.text = "Closing ceremony"
               next2Label.text = ""
               next3Label.text = ""
               time1Label.text = "07:00 AM"
               time2Label.text = ""
               time3Label.text = ""
               //currentEventstaticLabel.text = ""
               //roundendinStaticLabel.text = "Closing ceremony"
           }
       }

}

