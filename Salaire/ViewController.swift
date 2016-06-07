//
//  ViewController.swift
//  Salaire
//
//  Created by Manfred Touron on 03/06/16.
//  Copyright © 2016 42.am. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var yearlyGross: Double!

    @IBOutlet weak var HourlyGrossValue: UITextField!
    @IBOutlet weak var HourlyNetValue: UITextField!
    @IBOutlet weak var MonthlyNetValue: UITextField!
    @IBOutlet weak var MonthlyGrossValue: UITextField!
    @IBOutlet weak var YearlyNetValue: UITextField!
    @IBOutlet weak var YearlyGrossValue: UITextField!
    
    @IBOutlet weak var hoursPerWeekValue: UITextField!
    @IBOutlet weak var monthsPerYearValue: UITextField!
    @IBOutlet weak var wageCostsValue: UITextField!
    
    @IBAction func HourlyGrossChanged(sender: AnyObject)   { refresh() }
    @IBAction func HourlyNetChanged(sender: AnyObject)     { computeValues(netToGross(hoursToYears(parseDoubleInput(HourlyNetValue)))) }
    @IBAction func MonthlyGrossChanged(sender: AnyObject)  { computeValues(monthsToYears(parseDoubleInput(MonthlyGrossValue))) }
    @IBAction func MonthlyNetChanged(sender: AnyObject)    { computeValues(netToGross(monthsToYears(parseDoubleInput(MonthlyNetValue)))) }
    @IBAction func YearlyGrossChanged(sender: AnyObject)   { computeValues(parseDoubleInput(YearlyGrossValue)) }
    @IBAction func YearlyNetChanged(sender: AnyObject)     { computeValues(netToGross(parseDoubleInput(YearlyNetValue))) }
    
    
    @IBAction func hoursPerWeekChanged(sender: AnyObject)  { refresh() }
    @IBAction func monthsPerYearChanged(sender: AnyObject) { refresh() }
    @IBAction func wageCostsChanged(sender: AnyObject)     { refresh() }
    
    func refresh()                                         {
        computeValues(hoursToYears(parseDoubleInput(HourlyGrossValue)))
    }

    func parseDoubleInput(field: UITextField!) -> Double {
        // FIXME: replace commas with points
        if !field.text!.isEmpty {
            return (field.text! as NSString).doubleValue
        }
        return (field.placeholder! as NSString).doubleValue
    }
    
    func formatNumber(number: Double) -> String {
        let ret = String(format:"%03.2f", arguments: [number])
        if ret.containsString(".00") {
            return String(format:"%01.0f", arguments: [number])
        }
        return ret
    }
    
    func computeValues(yearlyGross: Double) {
        
        if !YearlyGrossValue.isFirstResponder() {
            YearlyGrossValue.text = formatNumber(yearlyGross)
        }
        if !MonthlyGrossValue.isFirstResponder() {
            MonthlyGrossValue.text = formatNumber(yearsToMonths(yearlyGross))
        }
        if !HourlyGrossValue.isFirstResponder() {
            HourlyGrossValue.text = formatNumber(yearsToHours(yearlyGross))
        }
        if !YearlyNetValue.isFirstResponder() {
            YearlyNetValue.text = formatNumber(grossToNet(yearlyGross))
        }
        if !MonthlyNetValue.isFirstResponder() {
            MonthlyNetValue.text = formatNumber(grossToNet(yearsToMonths(yearlyGross)))
        }
        if !HourlyNetValue.isFirstResponder() {
            HourlyNetValue.text = formatNumber(grossToNet(yearsToHours(yearlyGross)))
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
        return hours * parseDoubleInput(hoursPerWeekValue) * 52 / 12
    }
    
    func monthsToHours(months: Double) -> Double {
        return months / (parseDoubleInput(hoursPerWeekValue) * 52 / 12)
    }
    
    func hoursToYears(hours: Double) -> Double {
        return monthsToYears(hoursToMonths(hours))
    }
    
    func yearsToHours(years: Double) -> Double {
        return monthsToHours(yearsToMonths(years))
    }
    
    func yearsToMonths(years: Double) -> Double {
        return years / parseDoubleInput(monthsPerYearValue)
    }
    
    func monthsToYears(months: Double) -> Double {
        return months * parseDoubleInput(monthsPerYearValue)
    }
    
    func netToGross(net: Double) -> Double {
        return net * 100 / (100 - parseDoubleInput(wageCostsValue))
    }
    
    func grossToNet(gross: Double) -> Double {
        return gross * (100 - parseDoubleInput(wageCostsValue)) / 100
    }
}

