//
//  ViewController.swift
//  StopWatchApp
//
//  Created by Minori Inoue on 10/2/16.
//  Copyright © 2016 Minori Inoue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var startTime: TimeInterval? = nil
    var timer: Timer?
    var elapsedTime: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonEnabled(start: true, stop: false, reset: false)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        if let t = self.startTime {
            let time: Double = NSDate.timeIntervalSinceReferenceDate - t + self.elapsedTime
            let sec: Int = Int(time)
            let msec: Int = Int((time-Double(sec))*100.0)
            self.timeLabel.text = String(format: "%02d:%02d:%02d", sec/60, sec%60, msec)
            
            
        }
        
    }
    
    func setButtonEnabled(start: Bool, stop: Bool, reset:Bool) {
        self.startButton.isEnabled = start
        self.stopButton.isEnabled = stop
        self.resetButton.isEnabled = reset

    }

    @IBAction func startTimer(_ sender: AnyObject) {
        self.startTime = NSDate.timeIntervalSinceReferenceDate
        self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        setButtonEnabled(start: false, stop: true, reset: false)
    }
    @IBAction func stopTimer(_ sender: AnyObject) {
        if let t = self.startTime {
            self.elapsedTime = NSDate.timeIntervalSinceReferenceDate - t
            self.timer?.invalidate()
            self.timer = nil
            setButtonEnabled(start: true, stop: false, reset: true)
        }
        
    }
    @IBAction func resetTimer(_ sender: AnyObject) {
        self.elapsedTime = 0.0
        self.startTime = nil
        self.timeLabel.text = "00:00:00"
        setButtonEnabled(start: true, stop: false, reset: false)
    }

}

