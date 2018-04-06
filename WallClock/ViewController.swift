//
//  ViewController.swift
//  WallClock
//
//  Created by Pavlo Novak on 4/4/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clockView2: ClockUIView!
    var timer = Timer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        runTimer()
    }
    
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.checkTime)), userInfo: nil, repeats: true)
    }
    
    @objc func checkTime() {
        
        let date = Date()
        let calendar = Calendar.current
        let hour = Double(calendar.component(.hour, from: date))
        let minute = Double(calendar.component(.minute, from: date))
        let second = Double(calendar.component(.second, from: date))
        updateView(hours: hour, minutes: minute, seconds: second)
    }
    
    func updateView(hours: Double, minutes: Double, seconds: Double) {
        
        let minute = minutes + seconds/60
        let hour = hours + minutes/60
        clockView2.fiSeconds = CGFloat((Double.pi*2)*seconds/60.0)
        clockView2.fiMinutes = CGFloat(Double.pi*2*minute/60.0)
        clockView2.fiHours = CGFloat(Double.pi*2*hour/12.0)
        clockView2.setNeedsDisplay()
    }
}

