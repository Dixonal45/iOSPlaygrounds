//
//  ViewController.swift
//  Login Lab
//
//  Created by Allison on 2/21/20.
//  Copyright © 2020 Allison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var forgotUserName: UIButton!
    @IBOutlet weak var username: UITextField!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    segue.destination.navigationItem.title = username.text
        guard let sender = sender as? UIButton else {return}
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUserName {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = username.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func forgotUserNameButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "mainSegue", sender: forgotUserName)
    }
    @IBAction func forotPasswordButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "mainSegue", sender: forgotPassword)
    }
    
}

