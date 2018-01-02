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
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return timeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeList[component].count
    }
    
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> Int? {
        return timeList[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let hour = self.pickerView(pickerView, titleForRow: 0, forComponent: 0)
        let minute = self.pickerView(pickerView, titleForRow: 1, forComponent: 1)
        let second = self.pickerView(pickerView, titleForRow: 2, forComponent: 2)
        timeLabel.text = hour?.description
        
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
