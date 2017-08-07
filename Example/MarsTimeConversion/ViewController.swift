//
//  ViewController.swift
//  MarsTimeConversion
//
//  Created by Mark Powell on 05/20/2016.
//  Copyright (c) 2016 Mark Powell. All rights reserved.
//

import UIKit
import MarsTimeConversion

class ViewController: UIViewController {
    
    @IBOutlet weak var utcText: UILabel!
    @IBOutlet weak var pdtText: UILabel!
    @IBOutlet weak var lmstText: UILabel!
    @IBOutlet weak var utc2label: UILabel!
    
    
    
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //start clock update timer
        timer = Timer.scheduledTimer(timeInterval: 0.10, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
        updateTime()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTime() {
        let now = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = NSTimeZone(abbreviation: "PDT") as TimeZone!
        pdtText.text = formatter.string(from: now as Date)
        formatter.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone!
        utcText.text = formatter.string(from: now as Date)
        
        let (_, _, _, _, _, _, _, _, _, _, msd, mtc, _, _) = MarsTimeConversion.getMarsTimes(now as Date, longitude:MarsTimeConversion.CURIOSITY_WEST_LONGITUDE)
        let sol = Int(msd-(360-MarsTimeConversion.CURIOSITY_WEST_LONGITUDE)/360)-49268
        let mtcInHours:Double = MarsTimeConversion.canonicalValue24(mtc - (360-MarsTimeConversion.CURIOSITY_WEST_LONGITUDE)*24.0/360.0)
        let hour:Int = Int(mtcInHours);
        let hours = String(format:"%02d", hour)
        let minute:Int = Int((mtcInHours-Double(hour))*60.0)
        let minutes = String(format:"%02d", minute)
        let second:Int = Int((mtcInHours-Double(hour))*3600.0 - Double(minute)*60.0)
        let secondDouble:Double = (mtcInHours-Double(hour))*3600.0 - Double(minute)*60.0
        let seconds = String(format:"%02d", second);
        lmstText.text = String("Sol \(sol) \(hours):\(minutes):\(seconds)")
        
        let utcTime = MarsTimeConversion.getUTCTimeForMSL(sol, hours: hour, minutes: minute, seconds: secondDouble)
        utc2label.text = formatter.string(from: utcTime)
    }
}

