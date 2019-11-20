//
//  Class2.swift
//  NegroniChallenge
//
//  Created by Raimondo Giordano on 12/11/2019.
//  Copyright © 2019 Raimondo Giordano. All rights reserved.
//

import UIKit
import CoreMotion
import Dispatch
import Foundation


class Class2: UIViewController {
    private let pedometer = CMPedometer()
    var pedometro1 = CMPedometerData()
    private var startDate: Date? = Date()
    var timer: Timer?
    
    @IBOutlet weak var labello: UILabel!
    
    override func viewDidLoad() {
        
       /* timer = Timer.scheduledTimer(timeInterval: 1,target:self,selector:#selector(self.displayYesterdaySteps),userInfo:nil, repeats:true)*/
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        timer = Timer.scheduledTimer(timeInterval: 1,target:self,selector:#selector(self.displayYesterdaySteps),userInfo:nil, repeats:true)
    }
}

extension Class2 {
    
    private func updateLabelloLabel() {
         let yesterday = Date.yesterday

         pedometer.queryPedometerData(from: yesterday, to: Date()) {
             [weak self] pedometerData, error in
             if let error = error {
                 self?.on(error: error)
             } else if let pedometerData = pedometerData {
                 DispatchQueue.main.async {
                     self?.labello.text = String(describing: pedometerData.numberOfSteps)
                 }
             }
         }
     }
    
    
    @objc private func displayYesterdaySteps() {
        if CMPedometer.isStepCountingAvailable() {
            updateLabelloLabel()
        } else {
            labello.text = "Not available"
        }
    }
    
    private func on(error: Error) {
        //handle error
    }

}

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .hour, value: -11, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
