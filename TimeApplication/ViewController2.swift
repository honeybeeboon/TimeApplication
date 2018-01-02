//
//  ViewController2.swift
//  TimeApplication
//
//  Created by 下澤一輝 on 2018/01/02.
//  Copyright © 2018年 下澤一輝. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    
    @IBOutlet weak var TimerView: UIPickerView!
    let timeList = [[Int](0...24),[Int](0...59),[Int](0...59)]
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var colonLabel1: UILabel!
    @IBOutlet weak var colonLabel2: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer = Timer()
    var startTime:TimeInterval = 0
    var interval:Double = 0.0
    var time:Double = 0.0
    var CountTime:Double = 0.0
    var resetTime:Double = 0.0
    
    override func viewDidLoad() {
         resetButton.isEnabled = false
        startButton.isEnabled = false
        stopButton.isEnabled = false
        hourLabel.isHidden = true
        minuteLabel.isHidden = true
        secondLabel.isHidden = true
        colonLabel1.isHidden = true
        colonLabel2.isHidden = true
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return timeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeList[component].count
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(timeList[component][row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow 
        row: Int, inComponent component: Int) {
        startButton.isEnabled = true
        stopButton.isEnabled = true
           let hour = self.pickerView(TimerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
        let minute = self.pickerView(TimerView, titleForRow: pickerView.selectedRow(inComponent: 1), forComponent: 1)
        let second = self.pickerView(TimerView, titleForRow: pickerView.selectedRow(inComponent: 2), forComponent: 2)
        
        CountTime = Double(Int(hour!)! * 3600 + Int(minute!)! * 60 + Int(second!)!)
        resetTime = CountTime
        hourLabel.text =  String(format:"%02d",Int(hour!)!)
        minuteLabel.text = String(format:"%02d",Int(minute!)!)
        secondLabel.text = String(format:"%02d",Int(second!)!)
        
    }

    @IBAction func Start(_ sender: Any) {
        startTime = Date().timeIntervalSince1970
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        startButton.isEnabled = false
        resetButton.isEnabled = false
        TimerView.isHidden = true
        hourLabel.isHidden = false
        minuteLabel.isHidden = false
        secondLabel.isHidden = false
        colonLabel1.isHidden = false
        colonLabel2.isHidden = false
    }
    
    @objc func update(){
        interval = Date().timeIntervalSince1970 - startTime
        time = CountTime - interval + 1
        
        if(time < 0){
            timer.invalidate()
        }
        
        hourLabel.text = String(format:"%02d", Int(time) / 3600)
        minuteLabel.text = String(format:"%02d", (Int(time)%3600)/60)
        secondLabel.text = String(format:"%02d",(Int(time)%3600)%60)
       
    }

    
    @IBAction func Stop(_ sender: Any) {
        resetButton.isEnabled = true
        startButton.isEnabled = true
        timer.invalidate()
        CountTime = Double(Int(hourLabel.text!)! * 3600 + Int(minuteLabel.text!)! * 60 + Int(secondLabel.text!)!)
    }
    
    @IBAction func reset(_ sender: Any) {
        resetButton.isEnabled = false
        TimerView.isHidden = false
        hourLabel.isHidden = true
        minuteLabel.isHidden = true
        secondLabel.isHidden = true
        colonLabel1.isHidden = true
        colonLabel2.isHidden = true
        hourLabel.text = String(format:"%02d", Int(resetTime) / 3600)
        minuteLabel.text = String(format:"%02d", (Int(resetTime)%3600)/60)
        secondLabel.text = String(format:"%02d",(Int(resetTime)%3600)%60)
        timer.invalidate()
        CountTime = Double(Int(hourLabel.text!)! * 3600 + Int(minuteLabel.text!)! * 60 + Int(secondLabel.text!)!)
        
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
