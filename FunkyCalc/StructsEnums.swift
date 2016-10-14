//
//  StructsEnums.swift
//  FunkyCalc
//
//  Created by hostname on 10/14/16.
//  Copyright © 2016 notungood. All rights reserved.
//

import Foundation

enum Operator :String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState :String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
