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
        computeValues(hoursToYears(inputDouble))
    }
    
    @IBAction func HourlyNetChanged(sender: AnyObject) {
        let inputDouble = (HourlyNetValue.text! as NSString).doubleValue
        computeValues(netToGross(hoursToYears(inputDouble)))
    }
    
    @IBAction func MonthlyGrossChanged(sender: AnyObject) {
        let inputDouble = (MonthlyGrossValue.text! as NSString).doubleValue
        computeValues(monthsToYears(inputDouble))
    }
    
    @IBAction func MonthlyNetChanged(sender: AnyObject) {
        let inputDouble = (MonthlyNetValue.text! as NSString).doubleValue
        computeValues(netToGross(monthsToYears(inputDouble)))
    }
    
    @IBAction func YearlyGrossChanged(sender: AnyObject) {
        let inputDouble = (YearlyGrossValue.text! as NSString).doubleValue
        computeValues(inputDouble)
    }
    
    @IBAction func YearlyNetChanged(sender: AnyObject) {
        let inputDouble = (YearlyNetValue.text! as NSString).doubleValue
        computeValues(netToGross(inputDouble))
    }
    
    var yearlyGross: Double!
    
    func computeValues(yearlyGross: Double) {
        
        if !YearlyGrossValue.isFirstResponder() {
            YearlyGrossValue.text = String(format:"%03.2f", arguments: [yearlyGross])
        }
        if !MonthlyGrossValue.isFirstResponder() {
            MonthlyGrossValue.text = String(format:"%03.2f", arguments: [yearsToMonths(yearlyGross)])
        }
        if !HourlyGrossValue.isFirstResponder() {
            HourlyGrossValue.text = String(format:"%03.2f", arguments: [yearsToHours(yearlyGross)])
        }
        if !YearlyNetValue.isFirstResponder() {
            YearlyNetValue.text = String(format:"%03.2f", arguments: [grossToNet(yearlyGross)])
        }
        if !MonthlyNetValue.isFirstResponder() {
            MonthlyNetValue.text = String(format:"%03.2f", arguments: [grossToNet(yearsToMonths(yearlyGross))])
        }
        if !HourlyNetValue.isFirstResponder() {
            HourlyNetValue.text = String(format:"%03.2f", arguments: [grossToNet(yearsToHours(yearlyGross))])
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

    // helpers
    func hoursToMonths(hours: Double) -> Double {
        return hours * (hoursPerWeekValue.text! as NSString).doubleValue * 52 / 12
    }
    
    func monthsToHours(months: Double) -> Double {
        return months / ((hoursPerWeekValue.text! as NSString).doubleValue * 52 / 12)
    }
    
    func hoursToYears(hours: Double) -> Double {
        return monthsToYears(hoursToMonths(hours))
    }
    
    func yearsToHours(years: Double) -> Double {
        return monthsToHours(yearsToMonths(years))
    }
    
    func yearsToMonths(years: Double) -> Double {
        return years / (monthsPerYearValue.text! as NSString).doubleValue
    }
    
    func monthsToYears(months: Double) -> Double {
        return months * (monthsPerYearValue.text! as NSString).doubleValue
    }
    
    func netToGross(net: Double) -> Double {
        let wageCosts = (wageCostsValue.text! as NSString).doubleValue
        return net * 100 / (100 - wageCosts)
    }
    
    func grossToNet(gross: Double) -> Double {
        let wageCosts = (wageCostsValue.text! as NSString).doubleValue
        return gross * (100 - wageCosts) / 100
    }
}

