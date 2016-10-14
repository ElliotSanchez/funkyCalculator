//
//  ViewController.swift
//  FunkyCalc
//
//  Created by hostname on 10/13/16.
//  Copyright © 2016 notungood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables for enums in StructsEnums
    var currentOperation :Operator = Operator.nothing
    var calcState :CalculationState = CalculationState.enteringNum
    
    // Results display elements
    @IBOutlet weak var resultLabel: UILabel!
    var firstValue :String = " "
    
    // Button actions
    //// Numbers
    @IBAction func clickNumber(_ sender: UIButton) {
        updateDisplay(number :String(sender.tag))
    }
    //// Operations
    @IBAction func clickOperator(_ sender: UIButton) {
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text {
            if num != " " {
                firstValue = num
            }
        }
        
        switch sender.tag {
        case 50:
            print("DEBUG add")
        case 51:
            print("DEBUG subtract")
        case 52:
            print("DEBUG multiply")
        case 53:
            print("DEBUG divide")
        default:
            return
        }
        
    }
    //// Equals
    @IBAction func clickEquals(_ sender: UIButton) {
        
    }
    
    // Display actions and logic
    func updateDisplay (number :String) {
        if calcState == CalculationState.newNumStarted {
            if let num = resultLabel.text {
                if num != " " {
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        } else if calcState == CalculationState.enteringNum {
            resultLabel.text = resultLabel.text! + number
        }
    }

    // No additional setup, so moved to bottom
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

