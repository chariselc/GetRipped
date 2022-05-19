//
//  ViewController.swift
//  NC1 Get RIPPED
//
//  Created by Charisel Christian Limantara on 25/04/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 150
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row+1)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print (row)
        calculate()
        
    }

    
    @IBOutlet weak var goalSegmentButton: UISegmentedControl!
    @IBOutlet weak var timeSliderButton: UISlider!
    @IBOutlet weak var bodyWeightButton: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var remainderLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //connect data:
        self.bodyWeightButton.delegate = self
        self.bodyWeightButton.dataSource = self
        self.timeSliderButton.maximumValue = 12
        self.timeSliderButton.minimumValue = 2
        
        // Input data into the Array:
        print (goalSegmentButton.selectedSegmentIndex)
        print (timeSliderButton.value)
        print (bodyWeightButton.selectedRow(inComponent: 0)+1)
        
    }
            
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(bodyWeightButton: UIPickerView) -> Int {
        return 1
    }
    
    @IBAction func goalSegmentedControlValueChange(_ sender: UISegmentedControl) {
        calculate()
        print (goalSegmentButton.selectedSegmentIndex)
        print (timeSliderButton.value)
        print (bodyWeightButton.selectedRow(inComponent: 0)+1)
    }
    @IBAction func sliderValueChange(_ sender: Any) {
        calculate()
    }
    
    func calculate() {
        var goal: Double
        switch (goalSegmentButton.selectedSegmentIndex) {
        case 0:
            goal = -1
        case 1 :
            goal = 0
        case 2 :
            goal = 1
            
        default:
            goal = 1
        }
//        var speed: Double
//        switch (timeSliderButton.value) {
//            if(case > 0 && case < 0.2)
//                default:1
//
//                }
        
        let speed = Int(timeSliderButton.value)
        let weight = Int(bodyWeightButton.selectedRow(inComponent:0)+1)
        // get slider data
        
       
        
        // get segmented control data
        
        // get picker data
        
        // calculate
        let doubleWeight = Double(weight)
        
        let result = doubleWeight * (Double(goal * Double(speed)) + 28)
        let protein = doubleWeight * Double(2.2)
        let remain = doubleWeight * (Double(goal * Double(speed)) + 28) - (doubleWeight * 10)
        let chicken = 100 / 31 * (doubleWeight * Double(2.2))

        print ("result: \(result)")
        // show result
        
        resultLabel.text = "You need to eat "+String(result.rounded(toPlaces: 2))+" Calories /day"
        
        proteinLabel.text = String(protein.rounded(toPlaces: 2)) + " g of protein or " + String(chicken.rounded(toPlaces: 2)) + " Chicken Breast"
        
        remainderLabel.text = "And " + String(remain.rounded(toPlaces: 2)) + " Calories of anything you like"
        }
    }
    


