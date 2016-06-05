//
//  ViewController.swift
//  Salaire
//
//  Created by Manfred Touron on 03/06/16.
//  Copyright © 2016 42.am. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var HourlyGrossValue: UITextField!
    @IBOutlet weak var HourlyNetValue: UITextField!
    @IBOutlet weak var MonthlyNetValue: UITextField!
    @IBOutlet weak var MonthlyGrossValue: UITextField!
    @IBOutlet weak var YearlyNetValue: UITextField!
    @IBOutlet weak var YearlyGrossValue: UITextField!
    
    @IBOutlet weak var hoursPerWeekValue: UITextField!
    @IBOutlet weak var monthsPerYearValue: UITextField!
    @IBOutlet weak var wageCostsValue: UITextField!
    
    @IBAction func HourlyGrossChanged(sender: AnyObject) {
        let inputDouble = (HourlyGrossValue.text! as NSString).doubleValue
        computeValues(inputDouble * 12 * 152)
    }
    
    @IBAction func HourlyNetChanged(sender: AnyObject) {
        let inputDouble = (HourlyNetValue.text! as NSString).doubleValue
        computeValues(inputDouble * 12 * 152)
    }
    
    @IBAction func MonthlyGrossChanged(sender: AnyObject) {
        let inputDouble = (MonthlyGrossValue.text! as NSString).doubleValue
        computeValues(inputDouble * 12)
    }
    
    @IBAction func MonthlyNetChanged(sender: AnyObject) {
        let inputDouble = (MonthlyNetValue.text! as NSString).doubleValue
        computeValues(inputDouble * 12)
    }
    
    @IBAction func YearlyGrossChanged(sender: AnyObject) {
        let inputDouble = (YearlyGrossValue.text! as NSString).doubleValue
        computeValues(inputDouble)
    }
    
    @IBAction func YearlyNetChanged(sender: AnyObject) {
        let inputDouble = (YearlyNetValue.text! as NSString).doubleValue
        computeValues(inputDouble)
    }
    
    var yearlyGross: Double!
    
    func computeValues(yearlyGross: Double) {
        
        if !YearlyGrossValue.isFirstResponder() {
            YearlyGrossValue.text = String(format:"%03.2f", arguments: [yearlyGross])
        }
        if !MonthlyGrossValue.isFirstResponder() {
            MonthlyGrossValue.text = String(format:"%03.2f", arguments: [yearlyGross / 12])
        }
        if !HourlyGrossValue.isFirstResponder() {
            HourlyGrossValue.text = String(format:"%03.2f", arguments: [yearlyGross / 12 / 152])
        }
        if !YearlyNetValue.isFirstResponder() {
            YearlyNetValue.text = String(format:"%03.2f", arguments: [yearlyGross])
        }
        if !MonthlyNetValue.isFirstResponder() {
            MonthlyNetValue.text = String(format:"%03.2f", arguments: [yearlyGross / 12])
        }
        if !HourlyNetValue.isFirstResponder() {
            HourlyNetValue.text = String(format:"%03.2f", arguments: [yearlyGross / 12 / 152])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

