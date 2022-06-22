//
//  MainViewModel.swift
//  Calculator
//
//  Created by Garry on 16/06/22.
//

import Foundation
import SwiftUI

final class MainViewModel: ObservableObject {    
    
    @Published var calculationText: String = ""
    
    let buttons: [[CalculatorButton]] = [
        [.allClear, .toggle, .percent, .division],
        [.seven, .eight, .nine, .multiplication],
        [.four, .five, .six, .substraction],
        [.one, .two, .three, .addition],
        [.zero, .decimal, .equal],
    ] 
    
    func buttonColor(color: CalculatorButton) -> Color {
        switch color {
        case .equal, .addition, .substraction, .multiplication, .division:
            return .primaryBlue
        case .allClear, .toggle, .percent:
            return .lightGray
        default:
            return .secondaryBlack
        }
    }
    
    func textColor(color: CalculatorButton) -> Color {
        switch color {
        case .allClear, .toggle, .percent:
            return .black
        default:
            return .white
        }
    }
    
    func buttonWidth(item: CalculatorButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - 48) / 4) * 2
        }
        return (UIScreen.main.bounds.width - 60) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 60) / 4
    }
    
    private var result: Double = 0
    var currentOperation: Operation = .none
    
    func calculation(button: CalculatorButton) {
        var currentValue = Double(self.calculationText) ?? 0
        
        switch button {
        case .addition:
            self.currentOperation = .addition
            self.result = Double(self.calculationText) ?? 0
            self.updateDisplayText(0)
        case .multiplication:
            self.currentOperation = .multiplication
            self.result = Double(self.calculationText) ?? 0
            self.updateDisplayText(0)
        case .substraction:
            self.currentOperation = .substraction
            self.result = Double(self.calculationText) ?? 0
            self.updateDisplayText(0)
        case .division:
            self.currentOperation = .division
            self.result = Double(self.calculationText) ?? 0
            self.updateDisplayText(0)
        case .equal:
            switch self.currentOperation {
            case .addition:
                self.result += currentValue
            case .division:
                self.result /= currentValue
            case .multiplication:
                self.result *= currentValue
            case .substraction:
                self.result -= currentValue
            case .none:
                break
            }
            self.updateDisplayText(self.result)

            if self.result == 0 {
                self.result = currentValue
            }
            
        case .allClear:
            currentValue = 0
            self.result = 0
            self.updateDisplayText(currentValue)
        case .percent:
            if currentValue != 0 {
                currentValue /= 100
                self.updateDisplayText(currentValue)
            }
        case .toggle:
            currentValue *= -1
            self.updateDisplayText(currentValue)

        default:
            if self.calculationText == "0" {
                self.calculationText = button.rawValue
            } else {
                self.calculationText.append(button.rawValue)
            }
        }
    }
    
    func updateDisplayText(_ value: Double) {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            self.calculationText = String(format: "%.0f", value)
        } else {
            self.calculationText = "\(value)"
        }
    }
}

