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
    
    @IBAction func HourlyGrossChanged(sender: AnyObject) {
        let inputDouble = (HourlyGrossValue.text! as NSString).doubleValue
        computeValues(inputDouble)
    }
    
    @IBAction func HourlyNetChanged(sender: AnyObject) {
        let inputDouble = (HourlyNetValue.text! as NSString).doubleValue
        computeValues(inputDouble)
    }
    
    @IBAction func MonthlyGrossChanged(sender: AnyObject) {
        let inputDouble = (MonthlyGrossValue.text! as NSString).doubleValue
        computeValues(inputDouble)
    }
    
    @IBAction func MonthlyNetChanged(sender: AnyObject) {
        let inputDouble = (MonthlyNetValue.text! as NSString).doubleValue
        computeValues(inputDouble)
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
    
    func computeValues(yearly: Double) {
        
        
        if !YearlyGrossValue.isFirstResponder() {
            YearlyGrossValue.text = (String)(yearly)
        }
        if !MonthlyGrossValue.isFirstResponder() {
            MonthlyGrossValue.text = (String)(yearly / 12)
        }
        if !HourlyGrossValue.isFirstResponder() {
            HourlyGrossValue.text = (String)(yearly / 12 / 30)
        }
        if !YearlyNetValue.isFirstResponder() {
            YearlyNetValue.text = (String)(yearly)
        }
        if !MonthlyNetValue.isFirstResponder() {
            MonthlyNetValue.text = (String)(yearly / 12)
        }
        if !HourlyNetValue.isFirstResponder() {
            HourlyNetValue.text = (String)(yearly / 12 / 30)
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

