//
//  TextField.swift
//  Calculator
//
//  Created by Garry on 17/06/22.
//

import SwiftUI

struct CalculatorTextField: View {
    
    var text: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .font(.system(size: 96, weight: .light, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct CalculatorTextField_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
