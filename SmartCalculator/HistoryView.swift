import SwiftUI

struct HistoryView: View {
    @ObservedObject var calculatorModel: CalculatorModel
    @Binding var isShowingHistory: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                if calculatorModel.historyItems.isEmpty {
                    VStack {
                        Spacer()
                        Text("无计算历史")
                            .font(.title2)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(calculatorModel.historyItems) { item in
                            VStack(alignment: .trailing, spacing: 4) {
                                Text(item.expression)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text(item.result)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Text(formattedDate(item.date))
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.vertical, 4)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                // Apply this result to current calculation
                                calculatorModel.displayValue = item.result
                                isShowingHistory = false
                            }
                        }
                    }
                    
                    Button(action: {
                        calculatorModel.clearHistory()
                    }) {
                        Text("清除历史记录")
                            .foregroundColor(.red)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle("计算历史")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingHistory = false
                    }) {
                        Text("完成")
                    }
                }
            }
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "zh_CN")
        return formatter.string(from: date)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(
            calculatorModel: CalculatorModel(),
            isShowingHistory: .constant(true)
        )
    }
}
