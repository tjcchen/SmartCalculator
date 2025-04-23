//
//  SmartCalculatorApp.swift
//  SmartCalculator
//
//  Created by Yang Chen on 2025-04-15.
//

import SwiftUI

@main
struct SmartCalculatorApp: App {
    init() {
        UserDefaults.standard.set(["zh-Hans"], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
