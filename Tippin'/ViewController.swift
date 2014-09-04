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
    @IBOutlet weak var tipHeaderLabel: UILabel!
    @IBOutlet weak var totalHeaderLabel: UILabel!

    // set the values for the start and end position of the labels
    let unselectedY : CGFloat = 314
    let selectedY : CGFloat = 274
    
    // set switch for the initial animation
    var initalAnimation:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mehLabel.text = "15%"
        averageLabel.text = "18%"
        greatLabel.text = "22%"
        tipLabel.text = ""
        totalLabel.text = ""

        self.billField.alpha = 0
        self.mehLabel.alpha = 0
        self.averageLabel.alpha = 0
        self.greatLabel.alpha = 0
        self.tipHeaderLabel.alpha = 0
        self.totalHeaderLabel.alpha = 0
        self.tipControl.alpha = 0
        
        UIView.animateWithDuration(0.3, delay: 0.7, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: nil, animations: {
            //self.averageLabel.frame.origin.y = self.selectedY
            //self.averageLabel.alpha = 1.0
            self.billField.frame.origin.y = 86
            self.billField.alpha = 1.0
            }, nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func billFieldControl(sender: AnyObject) {
        if(initalAnimation == false) {
            UIView.animateWithDuration(0.3, delay: 0, options: nil, animations: {
                self.tipControl.alpha = 1.0
                }, nil)
            UIView.animateWithDuration(0.3, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: nil, animations: {
                self.averageLabel.frame.origin.y = self.selectedY
                self.averageLabel.alpha = 1.0
            
                }, completion: { finished in
                    self.initalAnimation = true
                    
            })
        }
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.15, 0.18, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount  = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        
        if (billAmount != 0){
            tipHeaderLabel.alpha = 1.0
            totalHeaderLabel.alpha = 1.0
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        } else {
            tipHeaderLabel.alpha = 0
            totalHeaderLabel.alpha = 0
            tipLabel.text = ""
            totalLabel.text = ""
        }
        
        // Attempting to add "$" to the entry field
        // billField.text = String(format: "$%.2f", total)
        
    }
    

    @IBAction func onSegTap(sender: AnyObject) {
        var segPercentages = ["15%", "18%", "22%"]
        
        // Need to set another variable for the billField b/c not sure how to set global var
        var billAmountCheck  = (self.billField.text as NSString).doubleValue
        
        switch tipControl.selectedSegmentIndex {
        case 0:
            //mehLabel.text = segPercentages[0]
            //averageLabel.text = ""
            //greatLabel.text = ""
            
            // fade in tip labels
            UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: nil, animations: {
                self.mehLabel.frame.origin.y = self.selectedY
                self.mehLabel.alpha = 1.0

                self.averageLabel.frame.origin.y = self.unselectedY
                self.averageLabel.alpha = 0

                self.greatLabel.frame.origin.y = self.unselectedY
                self.greatLabel.alpha = 0
            }, nil)
            
        case 1:
           // mehLabel.text = ""
           // averageLabel.text = segPercentages[1]
           // greatLabel.text = ""
            
            // fade in tip labels
            UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: nil, animations: {
                self.mehLabel.frame.origin.y = self.unselectedY
                self.mehLabel.alpha = 0.0
                
                self.averageLabel.frame.origin.y = self.selectedY
                self.averageLabel.alpha = 1.0
                
                self.greatLabel.frame.origin.y = self.unselectedY
                self.greatLabel.alpha = 0.0
            }, nil)
            
        case 2:
          //  mehLabel.text = ""
          //  averageLabel.text = ""
           // greatLabel.text = segPercentages[2]
            
            // fade in tip labels
            UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: nil, animations: {
                var frame = self.mehLabel.frame
                frame.origin.y = self.unselectedY
                self.mehLabel.frame = frame
                self.mehLabel.alpha = 0.0
                
                frame = self.averageLabel.frame
                frame.origin.y = self.unselectedY
                self.averageLabel.frame = frame
                self.averageLabel.alpha = 0.0
                
                frame = self.greatLabel.frame
                frame.origin.y = self.selectedY
                self.greatLabel.frame = frame
                self.greatLabel.alpha = 1.0
            }, nil)
            
        default:
            break
        }
        // OLD CODE, works but it's if/then
        
//        if(tipControl.selectedSegmentIndex == 0) {
//            mehLabel.text = segPercentages[0]
//            averageLabel.text = ""
//            greatLabel.text = ""
//        } else if(tipControl.selectedSegmentIndex == 1) {
//            mehLabel.text = ""
//            averageLabel.text = segPercentages[1]
//            greatLabel.text = ""
//        } else {
//            mehLabel.text = ""
//            averageLabel.text = ""
//            greatLabel.text = segPercentages[2]
//        }
        if (billAmountCheck != 0){
            view.endEditing(true)
        }
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

