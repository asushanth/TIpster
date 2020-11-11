//
//  ViewController.swift
//  TIpster
//
//  Created by Adarsh Sushanth on 11/11/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var numSplit: UILabel!
    @IBOutlet weak var peopleInc: UIStepper!
    @IBOutlet weak var tipSplitLabel: UILabel!
    
     var total = Double(0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get intial bill amount and calculate tips
        let bill  = Double(billField.text!) ?? 0
        let tipPercentages = [0.15,0.18,0.2]
        
        //Calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = tip + bill
        
        //Update labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func clearButton(_ sender: Any) {
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.text = ""
        tipSplitLabel.text = "$0.00"
        peopleInc.value = 1
        numSplit.text = Int(peopleInc.value).description
    }
    
    @IBAction func splitIncrementer(_ sender: Any) {
        numSplit.text = Int(peopleInc.value).description
        let tipsplit = total/Double(peopleInc.value)
        tipSplitLabel.text = String(format: "$%.2f", tipsplit)
        
    }
}

