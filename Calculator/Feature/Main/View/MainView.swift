//
//  ContentView.swift
//  Calculator
//
//  Created by Garry on 16/06/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                CalculatorTextField(text: viewModel.calculationText)
                
                VStack(spacing: 12) {
                    ForEach(viewModel.buttons, id: \.self) { row in
                        HStack(spacing: 12) {
                            ForEach(row, id: \.self) { item in
                                ButtonPad(
                                    action: {viewModel.calculation(button: item)},
                                    text: item.rawValue,
                                    textColor: viewModel.textColor(color: item),
                                    backgroundColor: viewModel.buttonColor(color: item),
                                    buttonWidth: viewModel.buttonWidth(item: item),
                                    buttonHeight: viewModel.buttonHeight()
                                )
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
