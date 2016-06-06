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
        refresh()
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
    
    func refresh() {
        let inputDouble = (HourlyGrossValue.text! as NSString).doubleValue
        computeValues(hoursToYears(inputDouble))
    }
    
    @IBAction func hoursPerWeekChanged(sender: AnyObject) { refresh() }
    @IBAction func monthsPerYearChanged(sender: AnyObject) { refresh() }
    @IBAction func wageCostsChanged(sender: AnyObject) { refresh() }
    
    var yearlyGross: Double!
    
    func formatNumber(number: Double) -> String {
        return String(format:"%03.2f", arguments: [number])
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
    func getHoursPerWeek() -> Double {
        if (!hoursPerWeekValue.text!.isEmpty) {
            return (hoursPerWeekValue.text! as NSString).doubleValue
        }
        return (hoursPerWeekValue.placeholder! as NSString).doubleValue
    }
    func getMonthsPerYear() -> Double {
        if (!monthsPerYearValue.text!.isEmpty) {
            return (monthsPerYearValue.text! as NSString).doubleValue
        }
        return (monthsPerYearValue.placeholder! as NSString).doubleValue
    }
    func getWageCosts() -> Double {
        if (!wageCostsValue.text!.isEmpty) {
            return (wageCostsValue.text! as NSString).doubleValue
        }
        return (wageCostsValue.placeholder! as NSString).doubleValue
    }
    
    func hoursToMonths(hours: Double) -> Double {
        return hours * getHoursPerWeek() * 52 / 12
    }
    
    func monthsToHours(months: Double) -> Double {
        return months / (getHoursPerWeek() * 52 / 12)
    }
    
    func hoursToYears(hours: Double) -> Double {
        return monthsToYears(hoursToMonths(hours))
    }
    
    func yearsToHours(years: Double) -> Double {
        return monthsToHours(yearsToMonths(years))
    }
    
    func yearsToMonths(years: Double) -> Double {
        return years / getMonthsPerYear()
    }
    
    func monthsToYears(months: Double) -> Double {
        return months * getMonthsPerYear()
    }
    
    func netToGross(net: Double) -> Double {
        return net * 100 / (100 - getWageCosts())
    }
    
    func grossToNet(gross: Double) -> Double {
        return gross * (100 - getWageCosts()) / 100
    }
}

