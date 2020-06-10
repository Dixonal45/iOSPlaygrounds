//
//  timerTableViewCell.swift
//  Time It Version 2
//
//  Created by Allison Dixon on 6/8/20.
//  Copyright © 2020 Allison Dixon. All rights reserved.
//

import UIKit
import AVFoundation

class timerTableViewCell: UITableViewCell {

    var timer = Timer()
    var isPlaying = false
    var counter = Double()
    
    @IBOutlet weak var timerStartButton: UIButton!
    @IBOutlet weak var timerPauseButton: UIButton!
    @IBOutlet weak var timerTextField: UITextField!
    
    var timerValue: Double? {
        get {
            return Double(timerTextField.text!)
        }
    }
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func startTimer(_ sender: AnyObject) {
        if(isPlaying) {
            return
        }
        timerStartButton.isEnabled = false
        timerPauseButton.isEnabled = true

        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    @IBAction func pauseTimer(_ sender: AnyObject) {
        timerStartButton.isEnabled = true
        timerPauseButton.isEnabled = false

        timer.invalidate()
        isPlaying = false
    }
    
    
    @objc func UpdateTimer() {
        if timerValue! > 0 {
            counter = timerValue!
            counter -= 0.1
            timerTextField.text = String(format: "%.1f", counter)
            }

    }

}
