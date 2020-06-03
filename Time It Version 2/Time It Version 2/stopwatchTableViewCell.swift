//
//  stopwatchTableViewCell.swift
//  Time It Version 2
//
//  Created by Allison Dixon on 6/1/20.
//  Copyright © 2020 Allison Dixon. All rights reserved.
//

import UIKit

class stopwatchTableViewCell: UITableViewCell {
    
    // https://www.ioscreator.com/tutorials/stopwatch-tutorial
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false

    
    @IBOutlet weak var stopwatchLabel: UILabel!
    
    @IBOutlet weak var stopwatchStartButton: UIButton!
    @IBOutlet weak var stopwatchPauseButton: UIButton!
    @IBAction func startStopwatch(_ sender: Any) {
    }
    @IBAction func pauseStopwatch(_ sender: Any) {
    }

//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        stopwatchLabel.text = String(counter)
//        stopwatchPauseButton.isEnabled = false
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func startTimer(_ sender: AnyObject) {
        if(isPlaying) {
            return
        }
        stopwatchStartButton.isEnabled = false
        stopwatchPauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    @IBAction func pauseTimer(_ sender: AnyObject) {
        stopwatchStartButton.isEnabled = true
        stopwatchPauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
    }
    @objc func UpdateTimer() {
        counter = counter + 0.1
        stopwatchLabel.text = String(format: "%.1f", counter)
    }

}
