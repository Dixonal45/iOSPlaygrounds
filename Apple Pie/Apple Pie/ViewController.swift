//
//  ViewController.swift
//  Apple Pie
//
//  Created by Allison Dixon on 3/30/20.
//  Copyright © 2020 Allison Dixon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var listOfWords = ["chocolate", "rhythm", "jazz", "knight", "giraffe", "abject", "jewelry"]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLosses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
}

