//
//  StopWatch.swift
//  TimeApplication
//
//  Created by 下澤一輝 on 2018/01/02.
//  Copyright © 2018年 下澤一輝. All rights reserved.
//

import UIKit

class ViewController3 : UIViewController{

    @IBOutlet weak var MinuteLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var MSecondLabel: UILabel!
    
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    
    @IBOutlet weak var Minute: UILabel!
    @IBOutlet weak var Second: UILabel!
   @IBOutlet weak var MSecond: UILabel!
    @IBOutlet weak var getTimeButton: UIButton!
    
    
    var timer = Timer()
    var startTime:TimeInterval = 0
    var elapsedTime:Double = 0.0
    var time : Double = 0.0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResetButton.isEnabled = false
        StopButton.isEnabled = false
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Start(_ sender: Any) {
        StartButton.isEnabled = false
        ResetButton.isEnabled = false
        StopButton.isEnabled = true
        
        startTime = Date().timeIntervalSince1970
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    
    }
    
    @objc func update(){
        time = Date().timeIntervalSince1970 - startTime + elapsedTime
        let sec = Int(time)
        let msec = Int((time - Double(sec)) * 100.0)
        MinuteLabel.text = String(format:"%02d",sec / 60)
        SecondLabel.text = String(format:"%02d",sec % 60)
        MSecondLabel.text = String(format:"%02d",msec)
        
    
    }
    
    @IBAction func stop(_ sender: Any) {
        StartButton.isEnabled = true
        ResetButton.isEnabled = true
        StopButton.isEnabled = false
        
        timer.invalidate()
        elapsedTime = time
        
        
        
    }
    
    @IBAction func reset(_ sender: Any) {
        
        MinuteLabel.text = String(format:"%02d",00)
        SecondLabel.text = String(format:"%02d",00)
        MSecondLabel.text = String(format:"%02d",00)
        
        
    }
    
    @IBAction func getTime(_ sender: Any) {
        Minute.text = MinuteLabel.text
        Second.text = SecondLabel.text
        MSecond.text = MSecondLabel.text
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
