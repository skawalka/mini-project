//
//  BestScore.swift
//  Word Parts
//
//  Created by ICT on 17/11/2561 BE.
//  Copyright © 2561 ICTIM. All rights reserved.
//

import Foundation

class BestScore {
    var newBestScore : Int
    init(_ newBestScore : Int) {
        self.newBestScore = newBestScore
    }
    func getBestScore() -> Int {
        return newBestScore
    }
}
