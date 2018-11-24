//
//  PlayViewController.swift
//  Word Parts
//
//  Created by ICT on 9/11/2561 BE.
//  Copyright © 2561 ICTIM. All rights reserved.
//

import Foundation
import UIKit

class PlayViewController: ViewController {
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    var score = 0
    var timer = Timer()
    var timeCount = 60
    var randomChar = 0
    var answerShow1 = ""
    var answerShow2 = ""
    
    let charArray = ["an", "th", "pr"]
    var dictionary =
        ["animate", "animation", "animator", "animal", "ant", "ancient", "anchor",
         "them", "that", "than", "thill", "thump", "think", "thanks", "thunder", "the", "thumping",
         "program", "programmer", "programming", "profession", "professionor", "professional", "promotion", "product", "produce", "promote", "private", "primary", "prime", "price", "present", "presentation", "prompt"
        ]
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var ranCharLabel: UILabel!
    @IBOutlet weak var ansLabel1: UILabel!
    @IBOutlet weak var ansLabel2: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
//    @IBOutlet weak var timeBar: UIView!
    @IBOutlet weak var inputText: UITextField!
    
    @IBAction func sendAnsButton(_ sender: UIButton) {
        if timeCount > 0 {
            if let answer = inputText.text {
                inputText.text = nil
                for i in 0..<dictionary.count {
                    if dictionary[i] == answer && charArray[randomChar] == answer.prefix(2) {
                        score += 1
                        scoreLabel.text = "score :  \(score)"
                        if score%2 == 1 {
                            answerShow1 += "\(dictionary[i])\n"
                            ansLabel1.text = answerShow1
                        } else if score%2 == 0 {
                            answerShow2 += "\(dictionary[i])\n"
                            ansLabel2.text = answerShow2
                        }
                        dictionary.remove(at: i)
                        ProgressHUD.showSuccess()
                        break
                    }// if check word
                }// loop check word
            }// if check input
        }else{
            inputText.text = nil
        }
    }
    
    @IBAction func finButton(_ sender: UIButton) {
        checkStatus = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startOver()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PlayViewController.processTimer), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func processTimer() {
        if(timeCount == 0){
            timer.invalidate()
            checkStatus = false
            let scoreViewController = storyBoard.instantiateViewController(withIdentifier: "Score") as! ScoreViewController
            scoreViewController.score2 = score
            self.present(scoreViewController, animated: true)
        }else {
            timeCount -= 1
            timeLabel?.text = "\(timeCount)"
        }
    }
    
    func startOver() {
        score = 0
        timeCount = 60
        answerShow1 = ""
        answerShow1 = ""
        timeLabel?.text = "\(timeCount)"
        scoreLabel?.text = "score :  \(score)"
        randomChar = Int(arc4random_uniform(UInt32(charArray.count)))
        self.ranCharLabel?.text = charArray[randomChar]
        self.ansLabel1?.text = ""
        self.ansLabel2?.text = ""
        dictionary =
            ["animate", "animation", "animator", "animal", "ant", "ancient", "anchor",
             "them", "that", "than", "thill", "thump", "think", "thunder", "the", "",
             "program", "programer", "programing", "profession", "professionor", "professional", "promotion", "product", "produce", "promote", "private", "primary", "prime", "price", "present", "presentation", "prompt"
            ]
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let scoreViewController = storyBoard.instantiateViewController(withIdentifier: "Score") as! ScoreViewController
        self.present(scoreViewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let playViewController : ScoreViewController = segue.destination as! ScoreViewController
        playViewController.score2 = score
        
    }
    
}
