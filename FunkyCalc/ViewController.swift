//
//  ViewController.swift
//  FunkyCalc
//
//  Created by hostname on 10/13/16.
//  Copyright © 2016 notungood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // Button Actions
    @IBAction func ClickNumber (_ sender: UIButton) {
        
    }
    
    @IBAction func ClickOperator (_ sender: UIButton) {
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
    
    @IBAction func ClickEquals (_ sender: UIButton) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

