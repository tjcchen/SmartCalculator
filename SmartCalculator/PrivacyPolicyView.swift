import SwiftUI

struct PrivacyPolicyView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("隐私政策")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                    
                    Group {
                        Text("更新日期：2025年4月15日")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("感谢您使用智能计算器应用。我们非常重视您的个人信息和隐私保护。本隐私政策旨在向您说明我们如何收集、使用、存储和保护您的信息，以及您所享有的相关权利。请您在使用我们的服务前，仔细阅读并充分理解本政策内容。")
                        
                        Text("1. 信息收集")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("我们的智能计算器应用不会收集任何个人身份信息。我们只会在本地设备上存储您的计算历史记录，这些数据不会上传至我们的服务器或与第三方共享。")
                        
                        Text("2. 信息使用")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("计算历史记录仅用于方便您查看过去的计算内容，提升使用体验。您可以随时从应用内清除这些记录。")
                        
                        Text("3. 信息存储")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("所有计算记录均存储在您的设备本地，不会上传至云端。这些数据将一直保留，直到您选择删除它们或卸载应用程序。")
                        
                        Text("4. 信息安全")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("我们采取合理的安全措施保护您设备上存储的数据。由于数据仅保存在本地，因此不存在数据传输过程中的风险。")
                    }
                    
                    Group {
                        Text("5. 个人信息权利")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("根据中华人民共和国《个人信息保护法》，您对个人信息享有以下权利：\n• 知情权和决定权\n• 查阅、复制权\n• 更正、补充权\n• 删除权\n• 要求解释说明权\n由于我们的应用不收集个人信息，您可以直接通过应用设置管理您的计算历史记录。")
                        
                        Text("6. 隐私政策变更")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("我们可能会不定期更新本隐私政策。当政策发生重大变更时，我们会通过应用内通知或其他适当方式通知您。")
                        
                        Text("7. 联系我们")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("如果您对本隐私政策有任何疑问或建议，请通过以下方式联系我们：\n电子邮件：chenyangpoppin@163.com")
                    }
                }
                .padding()
            }
            .navigationBarTitle("隐私政策", displayMode: .inline)
            .navigationBarItems(trailing: Button("关闭") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// English version for non-Chinese users
struct PrivacyPolicyEnglish: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Privacy Policy")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                    
                    Group {
                        Text("Last Updated: April 15, 2025")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Thank you for using the Smart Calculator application. We highly value your personal information and privacy. This Privacy Policy is intended to explain how we collect, use, store, and protect your information, as well as the rights you have. Please carefully read and fully understand this policy before using our services.")
                        
                        Text("1. Information Collection")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Our Smart Calculator application does not collect any personal identification information. We only store your calculation history on your local device, and this data is not uploaded to our servers or shared with third parties.")
                        
                        Text("2. Information Usage")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Calculation history is only used to allow you to view your past calculations, enhancing your user experience. You can clear these records at any time from within the app.")
                        
                        Text("3. Information Storage")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("All calculation records are stored locally on your device and are not uploaded to the cloud. This data will be retained until you choose to delete it or uninstall the application.")
                        
                        Text("4. Information Security")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("We take reasonable security measures to protect the data stored on your device. Since the data is only saved locally, there are no risks associated with data transmission.")
                    }
                    
                    Group {
                        Text("5. Personal Information Rights")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("According to the Personal Information Protection Law of the People's Republic of China, you have the following rights regarding your personal information:\n• Right to know and decide\n• Right to access and copy\n• Right to correct and supplement\n• Right to delete\n• Right to request explanations\nSince our application does not collect personal information, you can directly manage your calculation history through the application settings.")
                        
                        Text("6. Privacy Policy Changes")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("We may update this Privacy Policy from time to time. When there are significant changes to the policy, we will notify you through in-app notifications or other appropriate means.")
                        
                        Text("7. Contact Us")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("If you have any questions or suggestions regarding this Privacy Policy, please contact us at:\nEmail: chenyangpoppin@163.com")
                    }
                }
                .padding()
            }
            .navigationBarTitle("Privacy Policy", displayMode: .inline)
            .navigationBarItems(trailing: Button("Close") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
