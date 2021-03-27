//
//  ContentView.swift
//  Calculator
//
//  Created by Miia Romanainen on 15.3.2021.
//

import SwiftUI

enum CalculatorButton:String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equal, add, subtract, multiply, divide
    case decimal
    case ac, plusMinus, percent, mc, mPlus, mMinus, squareRoot
    
    var title: String{
        switch self{
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "X"
        case .divide: return "/"
        case .plusMinus: return "+/-"
        case .percent: return "%"
        case .equal: return "="
        case .decimal: return "."
        case .mc: return "MC"
        case .mPlus: return "M+"
        case .mMinus: return "M-"
        case .squareRoot: return "√"
        default:
            return "AC"
        }
    }
    
    var backgroundColor: Color{
        switch self{
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            return Color(.darkGray)
        case .ac, .plusMinus,.percent, .mc, .mPlus, .mMinus, .squareRoot:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
}

class GlobalEnvironment: ObservableObject{
    @Published var display = ""
    
    func receiveInput(calculatorButton: CalculatorButton){
        self.display = calculatorButton.title
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct ContentView: View {
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons: [[CalculatorButton]] = [
        [.mc, .mPlus, .mMinus, .squareRoot],
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    var body: some View {
        ZStack(alignment: .bottom){
         Color.black.edgesIgnoringSafeArea(.all)
         VStack(spacing: 12){
         HStack{
         Spacer()
         Text(env.display).foregroundColor(.white)
         .font(.system(size: 64))
         }.padding()
         
         ForEach(buttons, id: \.self) { row in
         HStack(spacing: 12){
         ForEach(row, id: \.self) { button in
         CalculatorButtonView(button: button)
         }
         }.padding(.bottom)
        /* ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Text display
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                
                // Our buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(button: item),
                                        //height: self.buttonHeight()
                                        height: (UIScreen.main.bounds.width - 5*12)/4);
                                .background(item.color)
                                .foregroundColor(.white)
                                .cornerRadius(self.buttonWidth(button: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)*/
                }
            }
        }
    }
    
    func didTap(button: CalculatorButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            
            if button != .equal {
                self.value = "0"
            }
        case .ac:
            self.value = "0"
        case .decimal, .plusMinus, .percent:
            break
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
}
    struct CalculatorButtonView: View {
     var button: CalculatorButton
     @EnvironmentObject var env: GlobalEnvironment
     
     var body: some View {
     Button(action: {
    //self.didTap(button:button)
     self.env.receiveInput(calculatorButton: self.button) })
     {
        
     Text(button.title)
     .font(.system (size: 32))
     .frame(width:
     self.buttonWidth(button: button),height: (UIScreen.main.bounds.width - 5*12)/4)
     .foregroundColor(.white)
     .background(button.backgroundColor)
     .cornerRadius(self.buttonWidth(button: button))
     }
}
    
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4*12)/4 * 2
        }
        return (UIScreen.main.bounds.width - 5*12)/4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
        //ContentView()
        
    }
}

