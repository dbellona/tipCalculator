//
//  ViewController.swift
//  Tippin'
//
//  Created by David Bellona on 8/29/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var mehLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var greatLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mehLabel.text = ""
        averageLabel.text = "18%"
        greatLabel.text = ""
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.15, 0.18, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount  = (billField.text as NSString).doubleValue;
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }
    

    @IBAction func onSegTap(sender: AnyObject) {
        var segPercentages = ["15%", "18%", "22%"]
        if(tipControl.selectedSegmentIndex == 0) {
            mehLabel.text = segPercentages[0]
            averageLabel.text = ""
            greatLabel.text = ""
        } else if(tipControl.selectedSegmentIndex == 1) {
            mehLabel.text = ""
            averageLabel.text = segPercentages[1]
            greatLabel.text = ""
        } else {
            mehLabel.text = ""
            averageLabel.text = ""
            greatLabel.text = segPercentages[2]
        }
        view.endEditing(true)
    }

    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

