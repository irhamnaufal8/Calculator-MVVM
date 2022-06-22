//
//  Button.swift
//  Calculator
//
//  Created by Garry on 17/06/22.
//

import SwiftUI

struct ButtonPad: View {
    
    var action: () -> Void
    var text: String
    var textColor: Color?
    var backgroundColor: Color?
    var buttonWidth: CGFloat?
    var buttonHeight: CGFloat?
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.largeTitle)
                .foregroundColor(textColor)
                .frame(width: buttonWidth,
                       height: buttonHeight)
                .background(backgroundColor)
                .cornerRadius(buttonHeight ?? 0)
        }
        
    }
}

struct ButtonPad_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPad(action: {}, text: "1")
    }
}
