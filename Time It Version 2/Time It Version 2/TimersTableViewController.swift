//
//  TimersTableViewController.swift
//  Time It Version 2
//
//  Created by Allison Dixon on 4/13/20.
//  Copyright © 2020 Allison Dixon. All rights reserved.
//

import UIKit

class TimersTableViewController: UITableViewController {
    var timers = [String]()
    var newTimer: String = ""
    
    
    
    // start code I added for timer
    // https://medium.com/@connor.b645/swift-cell-based-countdown-timers-c43ef5391c3
    
    var timer: Timer?
    var countdownTimers: [(id: Int,
                           createdAt: TimeInterval,
                           duration: TimeInterval)] = {
    return [
    (0, Date().timeIntervalSince1970, 5),
    (1, Date().timeIntervalSince1970, 10),
    (2, Date().timeIntervalSince1970, 15),
    (3, Date().timeIntervalSince1970, 86400)
    ]
    }()
    // end code I added for timer
    
    

    @IBAction func cancel(segue:UIStoryboardSegue){
        
    }
    @IBAction func done(segue:UIStoryboardSegue){
        let timerDetailTVC = segue.source as! TimerDetailTableViewController
        newTimer = timerDetailTVC.name
        
        timers.append(newTimer)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timers = []
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    
    // start code added for timer
    func calculateTimeRemaining(countdownTimer:(index: Int,
                                                createdAt: TimeInterval,
                                                duration: TimeInterval))
    -> Double {
    return Double((countdownTimer.createdAt + countdownTimer.duration) - Date().timeIntervalSince1970)
    }
    
    func timeRemainingFormatted() -> String {
        let duration = TimeInterval(self)
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .hour, .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        return formatter.string(from: duration) ?? ""
    }
    func configureCell(withCountdownTimer countdownTimer: ( index: Int,
                       createdAt: TimeInterval,
                       duration: TimeInterval)) {
      let timeRemaining = self.calculateTimeRemaining(countdownTimer:
        countdownTimer)
      self.timerLabel.text = "\(timeRemaining.timeRemainingFormatted())"
      if self.timer == nil {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats:
                                          true) { timer in
          let newTime = self.calculateTimeRemaining(countdownTimer:
          countdownTimer)
          if newTime <= 0 {
        
           self.countdownCompleteDelegate?.countdownHasFinished(atIndex:
           countdownTimer.index)
          
          } else {
            self.timerLabel.text = newTime.timeRemainingFormatted()
          }
        }
      }
    }
    // end code i added for timer
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return timers.count
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            timers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = timers[indexPath.row]

        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        let backgroundImage = UIImage(named: "time it background")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        imageView.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = imageView.bounds
        imageView.addSubview(blurView)
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
