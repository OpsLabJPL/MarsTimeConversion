//
//  ViewController.swift
//  Marstime
//
//  Created by Mark Powell on 5/20/16.
//  Copyright © 2016 JPL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var utcText: UILabel!
    @IBOutlet weak var pdtText: UILabel!
    @IBOutlet weak var lmstText: UILabel!
    
    var timer:NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //start clock update timer
        timer = NSTimer.scheduledTimerWithTimeInterval(0.10, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
        updateTime()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateTime() {
        let now = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = NSTimeZone(abbreviation: "PDT")
        pdtText.text = formatter.stringFromDate(now)
        formatter.timeZone = NSTimeZone(abbreviation: "UTC")
        utcText.text = formatter.stringFromDate(now)
        
        let marsTimes = MarsTimeConversion.getMarsTimes(now, longitude:MarsTimeConversion.CURIOSITY_WEST_LONGITUDE)
        let msd:Double = marsTimes[10] as! Double
        let mtc = marsTimes[11]
        let sol = Int(msd-(360-MarsTimeConversion.CURIOSITY_WEST_LONGITUDE)/360)-49268
        let mtcInHours:Double = MarsTimeConversion.canonicalValue24(mtc.doubleValue - MarsTimeConversion.CURIOSITY_WEST_LONGITUDE*24.0/360.0)
        let hour:Int = Int(mtcInHours);
        let hours = String(format:"%02d", hour)
        let minute:Int = Int((mtcInHours-Double(hour))*60.0)
        let minutes = String(format:"%02d", minute)
        let second:Int = Int((mtcInHours-Double(hour))*3600.0 - Double(minute)*60.0)
        let seconds = String(format:"%02d", second);
        lmstText.text = String("Sol \(sol) \(hours):\(minutes):\(seconds)")
    }
}

