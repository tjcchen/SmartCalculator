import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showPrivacyPolicy = false
    @State private var showRestartAlert = false
    @State private var language = UserDefaults.standard.string(forKey: "UserSelectedLanguage") ?? (Locale.current.languageCode == "zh" ? "zh-Hans" : "en")
    
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
                
                Section(header: Text("语言/Language")) {
                    Picker("语言/Language", selection: $language) {
                        Text("中文").tag("zh-Hans")
                        Text("English").tag("en")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: language) { newValue in
                        UserDefaults.standard.set(newValue, forKey: "UserSelectedLanguage")
                        UserDefaults.standard.set([newValue], forKey: "AppleLanguages")
                        UserDefaults.standard.synchronize()
                        showRestartAlert = true
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
                if language == "zh-Hans" {
                    PrivacyPolicyView()
                } else {
                    PrivacyPolicyEnglish()
                }
            }
            .alert(isPresented: $showRestartAlert) {
                Alert(
                    title: Text(language == "zh-Hans" ? "需要重启应用" : "Restart Required"),
                    message: Text(language == "zh-Hans" ? "语言设置已更改，请重启应用以应用更改。" : "Language setting has been changed. Please restart the app to apply the changes."),
                    dismissButton: .default(Text(language == "zh-Hans" ? "确定" : "OK"))
                )
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
