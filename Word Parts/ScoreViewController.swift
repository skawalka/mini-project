//
//  ScoreViewController.swift
//  Word Parts
//
//  Created by ICT on 9/11/2561 BE.
//  Copyright © 2561 ICTIM. All rights reserved.
//

import Foundation
import UIKit

class ScoreViewController: PlayViewController {

    var bestScore2 : Int = 0
    var score2 = Int()
    
    @IBOutlet weak var showScoreLabel: UILabel!
    @IBOutlet weak var bestScoreLabel2: UILabel!
    
    @IBAction func replayButton(_ sender: Any) {
//        checkStatus = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.invalidate()
        if bestScore2 < score2 {
            bestScore2 = score2
        }
        self.bestScoreLabel2.text = "BEST  SCORE    \(bestScore2)"
        self.showScoreLabel.text = String(score2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreViewController : ViewController = segue.destination as! ViewController
        scoreViewController.bestScore = bestScore2
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let playViewController = storyBoard.instantiateViewController(withIdentifier: "Play") as! PlayViewController
        self.present(playViewController, animated: true, completion: nil)
    }
    
}
