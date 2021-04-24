//
//  ContentView.swift
//  Calculator
//
//  Created by Miia Romanainen on 15.3.2021.
//

import SwiftUI

enum CalculatorButton: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "/"
    case plusMinus = "+/-"
    case percent = "%"
    case equal = "="
    case decimal = "."
    case mc = "MC"
    case mPlus = "M+"
    case pow = "x^"
    case squareRoot = "√"
    case ac = "AC"
    
    var buttonColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            return Color(.darkGray)
        case .ac, .plusMinus,.percent, .mc, .mPlus, .pow, .squareRoot:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, percent, pow, squareRoot, none
}

struct ContentView: View {
    @State var value = "0"
    @State var runningNumber: Double = 0
    @State var currentOperation: Operation = .none
    @Environment(\.managedObjectContext)var managedObjectContext
    
    let buttons: [[CalculatorButton]] = [
        [.mc, .mPlus, .pow, .squareRoot],
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                // Spacer()
                
                // Text display
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                }
                .padding(.top, 3)
                
                // Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.tapButton(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(button: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(button: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 2)
                }
            }
        }
    }
    
    func tapButton(button: CalculatorButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal, .squareRoot, .percent, .pow:
            if button == .add {
                currentOperation = .add
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .percent {
                self.currentOperation = .percent
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .squareRoot {
                self.currentOperation = .squareRoot
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .pow {
                self.currentOperation = .pow
                self.runningNumber = Double(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Double(self.value) ?? 0
                
                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .percent: self.value = "\(runningValue / 100 * currentValue)"
                case .squareRoot: self.value = "\(abs(runningValue).squareRoot())"
                case .pow: self.value = "\(pow(runningValue,currentValue))"
                case .none:
                    break
                }
            }
            if button != .equal {
                // self.value = ""
                self.value = "0"
            }

        case .ac:
            self.value = "0"
        case .decimal:
            self.value = value + button.rawValue
            break
        case .plusMinus:
            self.value = "-" + value
            break
        /*case .mPlus:
             MemoryView()*/
            
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4*12)/4 * 2
        }
        return (UIScreen.main.bounds.width - 5*12)/4
    }
    
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12))/4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

