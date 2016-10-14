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
    var calcState :CalculationState = CalculationState.calcComplete
    
    // Results display elements
    @IBOutlet weak var resultLabel: UILabel!
    var priorValue :String = " "
    
    
    // Button actions
    //// Numbers
    @IBAction func clickNumber(_ sender: UIButton) {
        updateDisplay(number :String(sender.tag))
        calcState = CalculationState.enteringNum
    }
    
    //// Operations
    @IBAction func clickOperator(_ sender: UIButton) {
        calcState = CalculationState.newNumStarted
        
        switch sender.tag {
        case 50:
            currentOperation = Operator.add
        case 51:
            currentOperation = Operator.subtract
        case 52:
            currentOperation = Operator.multiply
        case 53:
            currentOperation = Operator.divide
        default:
            return
        }
        
        if let num :String = resultLabel.text {
            if num != " " {
                priorValue = num
                resultLabel.text = " "
            }
        }
    }
    
    //// Equals
    @IBAction func clickEquals(_ sender: UIButton) {
        calculateSum()
    }
    
    // Display actions
    func updateDisplay(number :String) {
        if calcState == CalculationState.newNumStarted {
            if let num = resultLabel.text {
                if num != " " {
                    priorValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        } else if calcState == CalculationState.enteringNum {
            resultLabel.text = resultLabel.text! + number
        } else if calcState == CalculationState.calcComplete {
            resultLabel.text = number
        }
    }
    
    // Calculation logic
    func calculateSum() {
        if priorValue == " " {
            return
        }
        
        var result :String = " "
        let currentValue :String = resultLabel.text!
        
        print("ELLIOTDBG \(resultLabel.text)")
        print("ELLIOTDBG \(Double(resultLabel.text!))")
        print("ELLIOTDBG \(Double(priorValue))")
        print("ELLIOTDBG \(Double(currentValue))")
                
        if currentOperation == Operator.add {
            result = "\(Double(priorValue)! + Double(currentValue)!)"
        } else if currentOperation == Operator.subtract {
            result = "\(Double(priorValue)! - Double(currentValue)!)"
        } else if currentOperation == Operator.multiply {
            result = "\(Double(priorValue)! * Double(currentValue)!)"
        } else if currentOperation == Operator.divide {
            result = "\(Double(priorValue)! / Double(currentValue)!)"
        } else {
            return
        }
    
        calcState = CalculationState.calcComplete
        updateDisplay(number: result)
    }

    
    // No setup so moved to bottom
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

