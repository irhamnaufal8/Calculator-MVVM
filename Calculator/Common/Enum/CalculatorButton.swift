//
//  Calculator.swift
//  Calculator
//
//  Created by Garry on 21/06/22.
//

import Foundation

enum CalculatorButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case division = "/"
    case multiplication = "x"
    case substraction = "-"
    case addition = "+"
    case equal = "="
    case allClear = "AC"
    case toggle = "+-"
    case percent = "%"
    case decimal = "."
    
}

enum Operation {
    case addition, substraction, multiplication, division, none
}
