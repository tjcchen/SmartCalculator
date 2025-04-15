import SwiftUI

// Define button types with appropriate styling
enum CalcButtonType {
    case digit
    case operation
    case function
    case equals
    
    var backgroundColor: Color {
        switch self {
        case .digit:
            return Color(UIColor.systemGray5)
        case .operation:
            return Color.orange
        case .function:
            return Color(UIColor.systemGray3)
        case .equals:
            return Color.orange
        }
    }
    
    var foregroundColor: Color {
        return .white
    }
}

// Reusable calculator button component
struct CalcButton: View {
    var title: String
    var type: CalcButtonType
    var size: CGSize = CGSize(width: 70, height: 70)
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(type.foregroundColor)
                .frame(width: size.width, height: size.height)
                .background(type.backgroundColor)
                .cornerRadius(size.height / 2)
        }
    }
}

struct CalcButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CalcButton(title: "1", type: .digit) {}
            CalcButton(title: "+", type: .operation) {}
            CalcButton(title: "=", type: .equals) {}
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
