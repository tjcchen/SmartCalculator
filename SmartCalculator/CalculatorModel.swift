import Foundation

// Define the different operations our calculator can perform
enum Operation {
    case none
    case addition
    case subtraction
    case multiplication
    case division
    case percentage
    
    var symbol: String {
        switch self {
        case .none: return ""
        case .addition: return "+"
        case .subtraction: return "-"
        case .multiplication: return "×"
        case .division: return "÷"
        case .percentage: return "%"
        }
    }
}

// Model for storing calculation history
struct CalculationHistoryItem: Identifiable, Codable {
    var id = UUID()
    let expression: String
    let result: String
    let date: Date
    
    init(expression: String, result: String) {
        self.expression = expression
        self.result = result
        self.date = Date()
    }
}

// Main calculator model that handles calculations and history
class CalculatorModel: ObservableObject {
    @Published var displayValue: String = "0"
    @Published var historyItems: [CalculationHistoryItem] = []
    
    private var isPerformingOperation = false
    private var currentOperation: Operation = .none
    private var previousValue: Double = 0
    private var shouldResetDisplay = true
    
    // Formatter for displaying numbers
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 8
        formatter.minimumFractionDigits = 0
        return formatter
    }()
    
    // MARK: - Public Methods
    
    func appendDigit(_ digit: String) {
        if shouldResetDisplay || displayValue == "0" {
            displayValue = digit
            shouldResetDisplay = false
        } else if displayValue.count < 15 {
            displayValue += digit
        }
    }
    
    func setDecimalPoint() {
        if shouldResetDisplay {
            displayValue = "0."
            shouldResetDisplay = false
        } else if !displayValue.contains(".") {
            displayValue += "."
        }
    }
    
    func performOperation(_ operation: Operation) {
        if currentOperation != .none {
            calculateResult()
        }
        
        currentOperation = operation
        previousValue = Double(displayValue) ?? 0
        shouldResetDisplay = true
    }
    
    func calculateResult() {
        let currentValue = Double(displayValue) ?? 0
        var result: Double = 0
        
        let expressionText = "\(formatNumber(previousValue)) \(currentOperation.symbol) \(formatNumber(currentValue))"
        
        switch currentOperation {
        case .none:
            return
            
        case .addition:
            result = previousValue + currentValue
            
        case .subtraction:
            result = previousValue - currentValue
            
        case .multiplication:
            result = previousValue * currentValue
            
        case .division:
            if currentValue != 0 {
                result = previousValue / currentValue
            } else {
                displayValue = NSLocalizedString("错误", comment: "Division by zero error")
                currentOperation = .none
                shouldResetDisplay = true
                return
            }
            
        case .percentage:
            result = previousValue * (currentValue / 100.0)
        }
        
        let resultText = formatNumber(result)
        displayValue = resultText
        
        // Add to history
        let historyItem = CalculationHistoryItem(expression: expressionText, result: resultText)
        historyItems.insert(historyItem, at: 0)
        
        // Limit history to 100 items
        if historyItems.count > 100 {
            historyItems.removeLast()
        }
        
        // Save history
        saveHistory()
        
        currentOperation = .none
        shouldResetDisplay = true
    }
    
    func clearEntry() {
        displayValue = "0"
        shouldResetDisplay = true
    }
    
    func clearAll() {
        displayValue = "0"
        currentOperation = .none
        previousValue = 0
        shouldResetDisplay = true
    }
    
    func toggleSign() {
        if displayValue != "0" {
            if displayValue.hasPrefix("-") {
                displayValue.removeFirst()
            } else {
                displayValue = "-" + displayValue
            }
        }
    }
    
    func deleteLastDigit() {
        if !shouldResetDisplay && displayValue != "0" {
            displayValue.removeLast()
            if displayValue.isEmpty || displayValue == "-" {
                displayValue = "0"
            }
        }
    }
    
    // MARK: - History Management
    
    func loadHistory() {
        if let data = UserDefaults.standard.data(forKey: "calculatorHistory") {
            do {
                let decoder = JSONDecoder()
                historyItems = try decoder.decode([CalculationHistoryItem].self, from: data)
            } catch {
                print("Failed to load history: \(error)")
            }
        }
    }
    
    func saveHistory() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(historyItems)
            UserDefaults.standard.set(data, forKey: "calculatorHistory")
        } catch {
            print("Failed to save history: \(error)")
        }
    }
    
    func clearHistory() {
        historyItems.removeAll()
        saveHistory()
    }
    
    // MARK: - Helper Methods
    
    private func formatNumber(_ number: Double) -> String {
        return numberFormatter.string(from: NSNumber(value: number)) ?? "0"
    }
}
