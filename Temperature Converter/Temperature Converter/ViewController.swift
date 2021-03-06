//
//  ViewController.swift
//  Temperature Converter
//
//  Created by Allison on 2/6/20.
//  Copyright © 2020 Allison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fLabel: UILabel!
    

    @IBOutlet weak var degreesFOrC: UITextField!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.addTarget(self, action: #selector((changeText)), for: .valueChanged)
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButton(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            let fahrenheit = Double(degreesFOrC.text!)
            let celsius = (5 / 9.0) * (fahrenheit! - 32)
            celsiusLabel.text = String(celsius)
        }
        else {
            let celsius = Double(degreesFOrC.text!)
            let fahrenheit = ((9 / 5.0) * celsius!) + 32
            celsiusLabel.text = String(fahrenheit)
        }
    }
    @objc func changeText() {
        if segmentedControl.selectedSegmentIndex == 1 {
            fLabel.text = "Celsius"
            celsiusLabel.text = "Fahrenheit"
        }
        else {
            fLabel.text = "Fahrenheit"
            celsiusLabel.text = "Celsius"
        }
    }
}

