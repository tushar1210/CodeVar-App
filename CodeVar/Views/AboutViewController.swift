//
//  AboutViewController.swift
//  CodeVar
//
//  Created by Poorna Chandra Vemula on 30/11/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class AboutViewController: UIViewController {

    var profileImage = UserDefaults.standard.string(forKey: "profileImage") ?? ""
    var aboutUs = """
    CodeVar is a national level Code-A-Thon which is planned to be conducted in three phases as below
    Phase 1: Online Screening
    Pahse 1: Online Screening 2
    Phase 2: Code-A-Thon at Vellore Institute of Technology

    Phase 1 - Online Screening

    This is the first event to encourage programmers towards open coding wherein you can solve any question from a list of 1000+ questions with difficulties ranging from easy to advance. This will give equal chances to all the levels of programmers. Top 100 participants in the leaderboard will be invited to Vellore Institute of Technology, Vellore to participate in the code-a-thon which is scheduled to be conducted on 7th - 8th of December, 2019.

    Phase 1 - Online Screening 2

    This is the first event to encourage programmers towards open coding wherein you can solve any question from a list of 1000+ questions with difficulties ranging from easy to advance. This will give equal chances to all the levels of programmers. Top 140 participants in the leaderboard will be invited to Vellore Institute of Technology, Vellore to participate in the code-a-thon which is scheduled to be conducted on 7th - 8th of December, 2019.


    Points to note:

    Screening 2 starts at 10AM IST on 30-11-2019 and will end at 4PM on 01-12-2019.

    If you are in top 100 you are not allowed to participate in this round, unless explicitly told by our team.

    Results will be out on 01-12-2019, an email will be sent to you if you are in top 140.

    If we are unable to get 240 participants by the end of screening round 2, 100 participants will be called after 240 and so on till we are able to get 240 participants for the final round.

    It is advised that you don't miss any examinations, we will not be taking any responsibility for the same.

    We will not be covering your travel expenses, so please don't request for the same.

    The event will be providing you internship opportunites so bring all possible documents with you that you think is important, again we are not responsible for any of your belongings.

    Screening 2 is same as Screening 1.

    Phase 2 - CodeVar - Code-A-Thon

    Top 240 participants in phase 1 will be invited to Vellore Institute of Technology, Vellore to participate in a 24 hour Code-A-Thon on 7th and 8th of December 2019. The Code-A-Thon will test your basics in programming and your expertise in data structues and algorithms. Questions will range from MCQ's to Company specific problems.
    
    These guidelines will help you register for this event

    To enter the event you will have to register for the event, if you don't have a CodePark account, you will have to create one to register for the event.

    After clicking on the register button, you will have to fill up your details so that we can verify whether you are eligible or not.

    If you are eligible for the event, you will get a see more button, you can click on the see more button to see your highights and standings in the leaderboard. We have also included an activity log section for you to keep track of whatever you do during the event.

    Once the event starts, you will get an option to see rounds, you can register for each rounds depending on your eligibility during the event only.

    Any queries regarding the event will be addressed by support@codepark.in, you can also find CodePark in various social media platforms

    Message us on facebook - @codepark.in
    Tweet or DM us on twitter - @codepark_in
    Follow us on instagram - @codepark_in
    
    Winners of the competition will be based on merit and rules setup by the parties conducting the event

    Phase 1

    Top 240 participants in the leaderboard

    Phase 2

    Each round will have a winners
    The participants with highest points in the leaderboard is the overall winner
    Domain wise winners will be awarded.

    We have collaborated with major companies from the industry to provide a greater level of exposure to the participants, the prizes will include the following

    Cash Prizes worth over 1 lakh
    Internship opportunity for top participants
    Internship opportunity at CodePark for top performers
    Participation certificates for top 240
    Event T-shirt and Swags
   """
    
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var eventTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventTextView.isEditable = false
        eventTextView.isScrollEnabled = false
        eventTextView.text = aboutUs
        imageView.sd_setImage(with: URL(string: profileImage ), placeholderImage: UIImage(named: "ankit"))
          
     }
}

