//
//  ContentView.swift
//  SmartCalculator
//
//  Created by Yang Chen on 2025-04-15.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var calculator = CalculatorModel()
    @State private var isShowingHistory = false
    @State private var isShowingSettings = false
    
    private let buttonSpacing: CGFloat = 12
    private let buttonSize: CGFloat = 70
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                // Display
                HStack {
                    Spacer()
                    Text(calculator.displayValue)
                        .font(.system(size: 60))
                        .fontWeight(.medium)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .frame(height: 80)
                }
                .padding(.horizontal)
                
                Divider()
                
                // Controls row (History & Settings)
                HStack {
                    // History button
                    Button(action: {
                        isShowingHistory = true
                    }) {
                        HStack {
                            Image(systemName: "clock.arrow.circlepath")
                            Text("历史记录")
                        }
                        .foregroundColor(.primary)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(16)
                    }
                    
                    Spacer()
                    
                    // Settings button
                    Button(action: {
                        isShowingSettings = true
                    }) {
                        HStack {
                            Image(systemName: "gear")
                            Text("设置")
                        }
                        .foregroundColor(.primary)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(16)
                    }
                }
                .padding(.horizontal)
                
                // Calculator buttons
                VStack(spacing: buttonSpacing) {
                    HStack(spacing: buttonSpacing) {
                        CalcButton(title: "AC", type: .function) {
                            calculator.clearAll()
                        }
                        
                        CalcButton(title: "±", type: .function) {
                            calculator.toggleSign()
                        }
                        
                        CalcButton(title: "%", type: .function) {
                            calculator.performOperation(.percentage)
                        }
                        
                        CalcButton(title: "÷", type: .operation) {
                            calculator.performOperation(.division)
                        }
                    }
                    
                    HStack(spacing: buttonSpacing) {
                        CalcButton(title: "7", type: .digit) {
                            calculator.appendDigit("7")
                        }
                        
                        CalcButton(title: "8", type: .digit) {
                            calculator.appendDigit("8")
                        }
                        
                        CalcButton(title: "9", type: .digit) {
                            calculator.appendDigit("9")
                        }
                        
                        CalcButton(title: "×", type: .operation) {
                            calculator.performOperation(.multiplication)
                        }
                    }
                    
                    HStack(spacing: buttonSpacing) {
                        CalcButton(title: "4", type: .digit) {
                            calculator.appendDigit("4")
                        }
                        
                        CalcButton(title: "5", type: .digit) {
                            calculator.appendDigit("5")
                        }
                        
                        CalcButton(title: "6", type: .digit) {
                            calculator.appendDigit("6")
                        }
                        
                        CalcButton(title: "-", type: .operation) {
                            calculator.performOperation(.subtraction)
                        }
                    }
                    
                    HStack(spacing: buttonSpacing) {
                        CalcButton(title: "1", type: .digit) {
                            calculator.appendDigit("1")
                        }
                        
                        CalcButton(title: "2", type: .digit) {
                            calculator.appendDigit("2")
                        }
                        
                        CalcButton(title: "3", type: .digit) {
                            calculator.appendDigit("3")
                        }
                        
                        CalcButton(title: "+", type: .operation) {
                            calculator.performOperation(.addition)
                        }
                    }
                    
                    HStack(spacing: buttonSpacing) {
                        CalcButton(title: "0", type: .digit, size: CGSize(width: buttonSize * 2 + buttonSpacing, height: buttonSize)) {
                            calculator.appendDigit("0")
                        }
                        
                        CalcButton(title: ".", type: .digit) {
                            calculator.setDecimalPoint()
                        }
                        
                        CalcButton(title: "=", type: .equals) {
                            calculator.calculateResult()
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                calculator.loadHistory()
            }
            .sheet(isPresented: $isShowingHistory) {
                HistoryView(calculatorModel: calculator, isShowingHistory: $isShowingHistory)
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
