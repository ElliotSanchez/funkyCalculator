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
    
    // Variables for calculation logic
    var firstValue :String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Button actions
    @IBAction func clickNumber(_ sender: UIButton) {
        updateDisplay(number :String(sender.tag))
    }
    
    @IBAction func clickOperator(_ sender: UIButton) {
        //calcState = CalculationState.newNumStarted
        
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
    
    @IBAction func clickEquals(_ sender: UIButton) {
        
    }
    
    // Display actions and logic
    func updateDisplay (number :String) {
        if calcState == CalculationState.newNumStarted {
            if let num = resultLabel.text {
                if num != "" {
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        } else if calcState == CalculationState.enteringNum {
            resultLabel.text = resultLabel.text! + number
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

