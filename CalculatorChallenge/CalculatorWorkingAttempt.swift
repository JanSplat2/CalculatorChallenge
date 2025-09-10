//
//  CalculatorWorkingAttempt.swift
//  CalculatorChallenge
//
//  Created by Dittrich, Jan - Student on 9/2/25.
//

import SwiftUI

// An enum to represent the calculator operations.
// Using an enum makes the code safer and easier to read than using simple strings.
enum Operation {
    case add, subtract, multiply, divide, none
}

struct CalculatorWorkingAttempt: View {
    // MARK: - State Variables
    // @State tells SwiftUI to watch these variables. When they change, the UI will update automatically.
    
    // The text for the main (large) display.
    @State private var displayValue = "0"
    
    // The text for the upper preview window, showing the ongoing equation.
    @State private var equationPreview = ""
    
    // The first number in a calculation (e.g., the '8' in "8 + 2").
    @State private var previousValue: Double? = nil
    
    // The number currently being entered by the user.
    @State private var currentValue: Double? = 0
    
    // The current operation (+, -, etc.).
    @State private var currentOperation: Operation = .none
    
    // Tracks if the user is in the middle of typing a number.
    @State private var isEnteringDigits = false
    
    var body: some View {
        ZStack {
            // Set the background to black and make it fill the entire screen
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                Spacer() // Pushes the calculator to the bottom
                
                // MARK: - Display Area
                // A VStack to hold both the preview and the main display, aligned to the right.
                VStack(alignment: .trailing, spacing: 8) {
                    // This is the new preview window.
                    Text(equationPreview)
                        .font(.system(size: 30))
                        .foregroundStyle(.gray)
                        .lineLimit(1)
                    
                    // This is the main display for the numbers.
                    Text(displayValue)
                        .font(.system(size: 95))
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5) // Shrinks the text if it gets too long
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 20)
                
                
                // MARK: - Buttons
                // Each button is a ZStack with an `.onTapGesture` modifier to call our logic function.
                
                // ROW 1
                HStack(spacing: 12) {
                    ZStack {
                        Circle().fill(Color(white: 0.6))
                        Text("AC").font(.largeTitle).foregroundColor(.black)
                    }.onTapGesture { buttonTapped("AC") }
                    
                    ZStack {
                        Circle().fill(Color(white: 0.6))
                        Text("±").font(.largeTitle).foregroundColor(.black)
                    }.onTapGesture { buttonTapped("±") }
                    
                    ZStack {
                        Circle().fill(Color(white: 0.6))
                        Text("%").font(.largeTitle).foregroundColor(.black)
                    }.onTapGesture { buttonTapped("%") }
                    
                    ZStack {
                        Circle().fill(Color.orange)
                        Text("÷").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("÷") }
                }
                
                // ROW 2
                HStack(spacing: 12) {
                    ZStack {
                        Circle().fill(Color(white: 0.2))
                        Text("7").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("7") }
                    
                    ZStack {
                        Circle().fill(Color(white: 0.2))
                        Text("8").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("8") }
                    
                    ZStack {
                        Circle().fill(Color(white: 0.2))
                        Text("9").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("9") }
                    
                    ZStack {
                        Circle().fill(Color.orange)
                        Text("×").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("×") }
                }
                
                // ROW 3
                HStack(spacing: 12) {
                    ZStack {
                        Circle().fill(Color(white: 0.2))
                        Text("4").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("4") }
                    
                    ZStack {
                        Circle().fill(Color(white: 0.2))
                        Text("5").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("5") }
                    
                    ZStack {
                        Circle().fill(Color(white: 0.2))
                        Text("6").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("6") }
                    
                    ZStack {
                        Circle().fill(Color.orange)
                        Text("-").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("-") }
                }
                
                // ROW 4
                HStack(spacing: 12) {
                    ZStack {
                        Circle().fill(Color(white: 0.2))
                        Text("1").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("1") }
                    
                    ZStack {
                        Circle().fill(Color(white: 0.2))
                        Text("2").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("2") }
                    
                    ZStack {
                        Circle().fill(Color(white: 0.2))
                        Text("3").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("3") }
                    
                    ZStack {
                        Circle().fill(Color.orange)
                        Text("+").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("+") }
                }
                
                // ROW 5
                HStack(spacing: 12) {
                    ZStack {
                        Capsule().fill(Color(white: 0.2))
                        Text("0").font(.largeTitle).foregroundColor(.white)
                    }
                    .frame(width: 200, height: 90)
                    .onTapGesture { buttonTapped("0") }
                    
                    ZStack {
                        Circle().fill(Color(white: 0.2))
                        Text(".").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped(".") }
                    
                    ZStack {
                        Circle().fill(Color.orange)
                        Text("=").font(.largeTitle).foregroundColor(.white)
                    }.onTapGesture { buttonTapped("=") }
                }
            }
        }
    }
    
    // MARK: - Helper Function
    
    /// Converts an Operation enum case to its display symbol.
    private func getOperationSymbol(_ operation: Operation) -> String {
        switch operation {
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "×"
        case .divide: return "÷"
        case .none: return ""
        }
    }
    
    // MARK: - Logic Functions
    
    /// The main function that handles all button presses.
    func buttonTapped(_ title: String) {
        switch title {
        case "AC":
            displayValue = "0"
            equationPreview = ""
            previousValue = nil
            currentValue = 0
            currentOperation = .none
            isEnteringDigits = false
            
        case "±":
            if displayValue != "0" {
                if displayValue.hasPrefix("-") {
                    displayValue.removeFirst()
                } else {
                    displayValue = "-" + displayValue
                }
                currentValue = Double(displayValue)
                updatePreview()
            }
            
        case "%":
            if let value = currentValue {
                currentValue = value / 100.0
                displayValue = formatResult(currentValue!)
                updatePreview()
            }
            
        case "÷", "×", "-", "+":
            if let prev = previousValue, let current = currentValue, currentOperation != .none, isEnteringDigits {
                let result = performCalculation(prev, current, currentOperation)
                displayValue = formatResult(result)
                currentValue = result
            }
            
            previousValue = currentValue
            equationPreview = "\(formatResult(currentValue ?? 0)) \(title)"
            isEnteringDigits = false
            
            if title == "÷" { currentOperation = .divide }
            else if title == "×" { currentOperation = .multiply }
            else if title == "-" { currentOperation = .subtract }
            else if title == "+" { currentOperation = .add }
            
        case "=":
            if let prev = previousValue, let current = currentValue {
                let opSymbol = getOperationSymbol(currentOperation)
                equationPreview = "\(formatResult(prev)) \(opSymbol) \(formatResult(current)) ="
                
                let result = performCalculation(prev, current, currentOperation)
                displayValue = formatResult(result)
                currentValue = result
                previousValue = nil
                currentOperation = .none
                isEnteringDigits = false
            }
            
        case ".":
            if isEnteringDigits {
                if !displayValue.contains(".") { displayValue += "." }
            } else {
                displayValue = "0."
                isEnteringDigits = true
            }
            currentValue = Double(displayValue)
            updatePreview()
            
        default: // This handles all the number buttons "0" through "9"
            if currentOperation == .none && previousValue == nil {
                equationPreview = ""
            }
            
            if isEnteringDigits {
                if displayValue == "0" {
                    displayValue = title
                } else if displayValue.count < 9 {
                    displayValue += title
                }
            } else {
                displayValue = title
                isEnteringDigits = true
            }
            currentValue = Double(displayValue)
            updatePreview()
        }
    }
    
    /// A centralized function to update the preview window text.
    private func updatePreview() {
        if currentOperation != .none, let prev = previousValue {
            let opSymbol = getOperationSymbol(currentOperation)
            equationPreview = "\(formatResult(prev)) \(opSymbol) \(displayValue)"
        } else {
            equationPreview = displayValue
        }
    }
    
    /// Performs the actual math calculation.
    func performCalculation(_ prev: Double, _ current: Double, _ operation: Operation) -> Double {
        switch operation {
        case .add:
            return prev + current
        case .subtract:
            return prev - current
        case .multiply:
            return prev * current
        case .divide:
            if current != 0 {
                return prev / current
            }
            return 0
        case .none:
            return current
        }
    }
    
    /// Formats the result to show a whole number if possible (e.g., "5" instead of "5.0").
    func formatResult(_ result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        } else {
            var formattedString = String(format: "%.7f", result)
            while formattedString.hasSuffix("0") {
                formattedString.removeLast()
            }
            if formattedString.hasSuffix(".") {
                formattedString.removeLast()
            }
            return formattedString
        }
    }
}

#Preview {
    CalculatorWorkingAttempt()
}

//Gemini did all of this xD
