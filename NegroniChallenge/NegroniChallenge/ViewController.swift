//
//  ViewController.swift
//  NegroniChallenge
//
//  Created by Raimondo Giordano on 12/11/2019.
//  Copyright © 2019 Raimondo Giordano. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    var raimondo = 0
    var titolo: String?

    var numeroPassi: Int?
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {

        if raimondo == 1{
            print("IF ok")
            label.isHidden = false
        
        } else{
            performSegue(withIdentifier: "prova", sender: self)
            /*let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let prova:Class2 = storyboard.instantiateViewController(identifier: "prova")*/
        }
        

        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    

 /*   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as! ViewController
        next.titolo = "ciao"
    }
*/
}


/*
 private let activityManager = CMMotionActivityManager()
 private let pedometer = CMPedometer()
 
 private func startTrackingActivityType() {
   activityManager.startActivityUpdates(to: OperationQueue.main) {
       [weak self] (activity: CMMotionActivity?) in

       guard let activity = activity else { return }
       DispatchQueue.main.async {
           if activity.walking {
               self?.activityTypeLabel.text = "Walking"
           } else if activity.stationary {
               self?.activityTypeLabel.text = "Stationary"
           } else if activity.running {
               self?.activityTypeLabel.text = "Running"
           } else if activity.automotive {
               self?.activityTypeLabel.text = "Automotive"
           }
       }
   }
 }

 private func startCountingSteps() {
   pedometer.startUpdates(from: Date()) {
       [weak self] pedometerData, error in
       guard let pedometerData = pedometerData, error == nil else { return }

       DispatchQueue.main.async {
           self?.stepsCountLabel.text = pedometerData.numberOfSteps.stringValue
       }
   }
 }

 private func startUpdating() {
   if CMMotionActivityManager.isActivityAvailable() {
       startTrackingActivityType()
   }

   if CMPedometer.isStepCountingAvailable() {
       startCountingSteps()
   }
 }
 */
