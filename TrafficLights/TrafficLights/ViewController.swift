//
//  ViewController.swift
//  TrafficLights
//
//  Created by Allison on 2/13/20.
//  Copyright © 2020 Allison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var feelings: UISwitch!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func returnToFirstScreen(unwindSegue: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = name.text
    }
    @IBAction func hadFeelings(_ sender: Any) {
        if feelings.isOn {
            performSegue(withIdentifier: "tickledPink", sender: nil)
        } else if !feelings.isOn {
            performSegue(withIdentifier: "feelingBlue", sender: nil)
        }
    }
    
}


