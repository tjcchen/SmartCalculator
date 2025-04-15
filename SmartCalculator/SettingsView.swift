import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showPrivacyPolicy = false
    @State private var language = Locale.current.languageCode == "zh" ? "中文" : "English"
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("应用信息")) {
                    HStack {
                        Text("版本")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section(header: Text("法律")) {
                    Button(action: {
                        showPrivacyPolicy = true
                    }) {
                        Text("隐私政策")
                    }
                }
                
                Section(header: Text("关于")) {
                    Text("智能计算器是一款功能强大的计算工具，支持基本计算操作和历史记录。所有历史数据都保存在本地设备上，不会上传到云端。")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("设置", displayMode: .inline)
            .navigationBarItems(trailing: Button("完成") {
                presentationMode.wrappedValue.dismiss()
            })
            .sheet(isPresented: $showPrivacyPolicy) {
                if language == "中文" {
                    PrivacyPolicyView()
                } else {
                    PrivacyPolicyEnglish()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
