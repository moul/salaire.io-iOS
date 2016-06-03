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
        print(HourlyGrossValue.text)
    }
    
    @IBAction func HourlyNetChanged(sender: AnyObject) {
        print(HourlyNetValue.text)
    }
    
    @IBAction func MonthlyGrossChanged(sender: AnyObject) {
        print(MonthlyGrossValue.text)
    }
    
    @IBAction func MonthlyNetChanged(sender: AnyObject) {
        print(MonthlyNetValue.text)
    }
    
    @IBAction func YearlyGrossChanged(sender: AnyObject) {
        print(YearlyGrossValue.text)
    }
    
    @IBAction func YearlyNetChanged(sender: AnyObject) {
        print(YearlyNetValue.text)
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

