//
//  Football_ImpostorApp.swift
//  Football Impostor
//
//  Created by Sara Volpe on 07/04/26.
//

import SwiftUI

@main
struct Football_ImpostorApp: App {

    @AppStorage("selectedLanguage") private var selectedLanguage = "en"
    @StateObject private var themeManager = ThemeManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .environment(\.locale, .init(identifier: selectedLanguage))
        }
    }
}
