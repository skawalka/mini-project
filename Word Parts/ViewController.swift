//
//  ViewController.swift
//  Word Parts
//
//  Created by ICT on 9/11/2561 BE.
//  Copyright © 2561 ICTIM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bestScore : Int = 0
    var checkStatus = false
    
    
    @IBOutlet weak var bestScoreLabel1: UILabel!
    
    @IBAction func playButton(_ sender: UIButton) {
        checkStatus = true
    }
    @IBAction func tutorialButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bestScoreLabel1?.text = "BEST  SCORE    \(bestScore)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        exit(0)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let viewController : ScoreViewController = segue.destination as! ScoreViewController
//        viewController.bestScore2 = bestScore
//    }

}


