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

let day1 = "\(07):\(12)" // 7 Dec
let day2 = "\(08):\(12)" // 8 Dec

let pm7 = "\(19):\(00)"  // 07PM
let pm9 = "\(21):\(00)"  // 09PM
let pm1159 = "\(23):\(59)"
let am12 = "\(00):\(00)"  // 12AM
let am2 = "\(02):\(00)"  // 02AM
let am6 = "\(06):\(00)"  // 06AM
let am9 = "\(09):\(00)"  // 09AM
let am10 = "\(10):\(00)"  // 10AM
let pm1 = "\(13):\(00)"  // 01PM
let pm3 = "\(15):\(00)"  // 03PM
let pm6 = "\(18):\(00)" // 06PM
let pm8 = "\(20):\(00)" // 08PM

func currentDeviceTime() -> String {
  return "\(hour):\(minute)"
}



class TimelineViewController: UIViewController {
    
    var profileImage = UserDefaults.standard.string(forKey: "profileImage") ?? ""
    let MAXTIME : Float = 100.0
    var currentTime : Float = 0.0
    
    var timer : Timer?
    var timeInterval:TimeInterval = 1.0
    let timerEnd:TimeInterval = 0.0
    var timeCount:TimeInterval = 7200.0 // seconds or 2 hours
    func gettimecount()
    {
        if eventTime >= pm7 && eventTime < pm9  && eventDate == day1 {  // 7pm to 9pm
            var timeCount:TimeInterval = 7200.0
        }
        else if eventTime >= pm9 && eventTime < pm1159 && eventDate == day1 {  // 9pm to 12am
            var timeCount:TimeInterval = 10800.0
        }
        else if eventTime >= am12 && eventTime < am2  && eventDate == day2 {  // 12am to 2am
            var timeCount:TimeInterval = 7200.0
        }
        else if eventTime >= am2 && eventTime < am6 && eventDate == day2 {  // 2am to 6am
            var timeCount:TimeInterval = 14400.0
        }
        else if eventTime >= am6 && eventTime < am9 && eventDate == day2 {  // 6am to 9am
            var timeCount:TimeInterval = 10800.0
        }
         /////////////
        else if eventTime >= am9 && eventTime < am10  && eventDate == day2 {  // 9am to 10am
            var timeCount:TimeInterval = 3600.0
        }
         
         
        else if eventTime >= am10 && eventTime < pm1  && eventDate == day2 {  // 10am to 1pm
            var timeCount:TimeInterval = 10800.0
        }
        else if eventTime >= pm1 && eventTime < pm3  && eventDate == day2 { // 1pm to 3pm
            var timeCount:TimeInterval = 7200.0
        }
        else if eventTime >= pm3 && eventTime < pm6 && eventDate == day2 { // 3pm to 6pm
            var timeCount:TimeInterval = 10800.0
        }
        else if eventTime >= pm7 && eventTime < pm8 && eventDate == day2 { // 7pm to 8pm
            var timeCount:TimeInterval = 3600.0
        }
    }
    func timerstart(){
        guard timer == nil else { return }
        
        timer = Timer.scheduledTimer(
        timeInterval: 1,
        target: self,
        selector: #selector(TimelineViewController.action),
        userInfo: nil,
        repeats: true)
    }
    func timerstop(){
       // var timer : Timer?
        timer?.invalidate()
        timer = nil
    }
    @objc func action()
    {
            timeCount -= 1
            timerLabel.text = "\(timeString(time: timeCount))"
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
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
    @IBOutlet weak var currenteventLabel: UILabel!
    @IBOutlet weak var roundendsinLabel: UILabel!
    @IBOutlet weak var upnextLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
        timerstart()
        updateLabels()
        profileImageView.sd_setImage(with: URL(string: profileImage ), placeholderImage: UIImage(named: "ankit"))
        profileBttn.layer.cornerRadius = 8
        profileBttn.clipsToBounds = true
        profileBttn.imageView?.sd_setImage(with: URL(string: profileImage ), placeholderImage: UIImage(named: "ankit"))
        self.progressView.value = 0
        self.progressView.maxValue = CGFloat(MAXTIME)
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
        if(!UserDefaults.standard.bool(forKey: "isLogin")){
                 self.tabBarController!.tabBar.isHidden = true
                 performSegue(withIdentifier: "goBack", sender: nil)
             }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1){
            self.updateProgress()
        }
    }
    
    //MARK:- code below is to update the progress Bar in the scene according to the time
    
   @objc func updateProgress(){
            if eventDate < day1 {
                self.progressView.value = 0
                timerstop()
            }
            if eventDate <= day1 && eventTime < pm7 {
                self.progressView.value = 0
                timerstop()
           }
           
           else if eventTime >= pm7 && eventTime < pm9  && eventDate == day1 { // 7pm to 9pm
               self.progressView.value = 8
               self.progressView.progressColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0) //yellow
               self.progressView.progressStrokeColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0)
           }
           else if eventTime >= pm9 && eventTime < pm1159  && eventDate == day1 { // 9pm to 12am
               self.progressView.value = 20
               self.progressView.progressColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0) // skyblue
               self.progressView.progressStrokeColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0)

           }
           else if eventTime >= am12 && eventTime < am2  && eventDate == day2 {  // 12am to 2am
               self.progressView.value = 28
               self.progressView.progressColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0) //yellow
               self.progressView.progressStrokeColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0)
           }
           else if eventTime >= am2 && eventTime < am6  && eventDate == day2 {  // 2am to 6am
               self.progressView.value = 44
               self.progressView.progressColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0) //skyblue
               self.progressView.progressStrokeColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0)
           }
           else if eventTime >= am6 && eventTime < am9  && eventDate == day2 {  // 6am to 9am
               self.progressView.value = 56
               self.progressView.progressColor = UIColor(red:0.64, green:0.00, blue:0.84, alpha:1.0) //purple
               self.progressView.progressStrokeColor = UIColor(red:0.64, green:0.00, blue:0.84, alpha:1.0)
           }
           else if eventTime >= am9 && eventTime < am10  && eventDate == day2 {  // 9am to 10am
               self.progressView.value = 60
               self.progressView.progressColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0) //yellow
               self.progressView.progressStrokeColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0)
           }
            
            //////////
           else if eventTime >= am10 && eventTime < pm1  && eventDate == day2 {  // 10am to 1pm
               self.progressView.value = 72
               self.progressView.progressColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0) //skyblue
               self.progressView.progressStrokeColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0)
           }
           else if eventTime >= pm1 && eventTime < pm3  && eventDate == day2 {  // 1pm to 3pm
               self.progressView.value = 80
               self.progressView.progressColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0) // yellow
               self.progressView.progressStrokeColor = UIColor(red:0.90, green:0.67, blue:0.01, alpha:1.0)
           }
           else if eventTime >= pm3 && eventTime < pm6  && eventDate == day2 {  // 3pm to 6pm
               self.progressView.value = 92
               self.progressView.progressColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0) // skyblue
               self.progressView.progressStrokeColor = UIColor(red:0.01, green:0.75, blue:0.91, alpha:1.0)
           }
           else if eventTime >= pm7 && eventTime < pm8  && eventDate == day2 {  // 7pm to 8pm
               self.progressView.value = 100
               self.progressView.progressColor = UIColor(red:0.64, green:0.00, blue:0.84, alpha:1.0) // purple
               self.progressView.progressStrokeColor = UIColor(red:0.64, green:0.00, blue:0.84, alpha:1.0)
           }
           
       }
       
       //MARK:- code below is to update the labels in the scene according to the time
       @objc func updateLabels(){
           if eventDate < day1 {
                currentLabel.text = "Welcome"
                next1Label.text = ""
                next2Label.text = ""
                next3Label.text = ""
                time1Label.text = ""
                time2Label.text = ""
                time3Label.text = ""
                upnextLabel.text = "The event will start soon."
                roundendsinLabel.text = ""
                currenteventLabel.text = ""
                timerLabel.text = ""
            }
            if eventDate <= day1 && eventTime < pm7 {
                currentLabel.text = "Welcome"
                next1Label.text = ""
                next2Label.text = ""
                next3Label.text = ""
                time1Label.text = ""
                time2Label.text = ""
                time3Label.text = ""
                upnextLabel.text = "The event will start soon."
                roundendsinLabel.text = ""
           }
           if eventTime >= pm7 && eventTime < pm9  && eventDate == day1 {  // 7pm to 9pm
               currentLabel.text = "Arrival"
               next1Label.text = "Arrival"
               next2Label.text = "Round1"
               next3Label.text = "Pizza"
               time1Label.text = "07:00 PM"
               time2Label.text = "09:00 PM"
               time3Label.text = "12:00 AM"
           }
           else if eventTime >= pm9 && eventTime < pm1159 && eventDate == day1 {  // 9pm to 12am
               currentLabel.text = "Round 1"
               next1Label.text = "Round 1"
               next2Label.text = "Pizza"
               next3Label.text = "Round 2"
               time1Label.text = "09:00 PM"
               time2Label.text = "12:00 AM"
               time3Label.text = "02:00 AM"
           }
           else if eventTime >= am12 && eventTime < am2  && eventDate == day2 {  // 12am to 2am
               currentLabel.text = "Pizza"
               next1Label.text = "Pizza"
               next2Label.text = "Round 2"
               next3Label.text = "Giveaway"
               time1Label.text = "12:00 AM"
               time2Label.text = "02:00 AM"
               time3Label.text = "06:00 AM"
           }
           else if eventTime >= am2 && eventTime < am6 && eventDate == day2 {  // 2am to 6am
               currentLabel.text = "Round 2"
               next1Label.text = "Round 2"
               next2Label.text = "Giveaway"
               next3Label.text = "Round 3"
               time1Label.text = "02:00 AM"
               time2Label.text = "06:00 AM"
               time3Label.text = "09:00 AM"
           }
           else if eventTime >= am6 && eventTime < am9 && eventDate == day2 {  // 6am to 9am
               currentLabel.text = "Giveaway"
               next1Label.text = "Giveaway"
               next2Label.text = "Breakfast"
               next3Label.text = "Round 3"
               time1Label.text = "06:00 AM"
               time2Label.text = "09:00 AM"
               time3Label.text = "10:00 AM"
           }
            /////////////
           else if eventTime >= am9 && eventTime < am10  && eventDate == day2 {  // 9am to 10am
               currentLabel.text = "Breakfast"
               next1Label.text = "Breakfast"
               next2Label.text = "Round 3"
               next3Label.text = "Lunch"
               time1Label.text = "09:00 AM"
               time2Label.text = "10:00 AM"
               time3Label.text = "01:00 pM"
           }
            
            
           else if eventTime >= am10 && eventTime < pm1  && eventDate == day2 {  // 10am to 1pm
               currentLabel.text = "Round 3"
               next1Label.text = "Round 3"
               next2Label.text = "Lunch"
               next3Label.text = "Round 4"
               time1Label.text = "10:00 AM"
               time2Label.text = "01:00 PM"
               time3Label.text = "03:00 PM"
           }
           else if eventTime >= pm1 && eventTime < pm3  && eventDate == day2 { // 1pm to 3pm
               currentLabel.text = "Lunch"
               next1Label.text = "Lunch"
               next2Label.text = "Round 4"
               next3Label.text = "Round 6"
               time1Label.text = "01:00 PM"
               time2Label.text = "03:00 PM"
               time3Label.text = "07:00 PM"
           }
           else if eventTime >= pm3 && eventTime < pm6 && eventDate == day2 { // 3pm to 6pm
               currentLabel.text = "Round 4"
               next1Label.text = "Round 4"
               next2Label.text = "Closing ceremony"
               next3Label.text = ""
               time1Label.text = "03:00 PM"
               time2Label.text = "07:00 PM"
               time3Label.text = ""
           }
           else if eventTime >= pm7 && eventTime < pm8 && eventDate == day2 { // 7pm to 8pm
               currentLabel.text = "All the best"
               next1Label.text = "Closing ceremony"
               next2Label.text = ""
               next3Label.text = ""
               time1Label.text = "07:00 AM"
               time2Label.text = ""
               time3Label.text = ""
           }
       }

}

