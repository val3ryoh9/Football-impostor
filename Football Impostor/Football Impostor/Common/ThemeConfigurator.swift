import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    @AppStorage("selectedAppearance") var selectedAppearance: Int = 0

    var selectedScheme: ColorScheme? {
        switch selectedAppearance {
        case 1: return .light
        case 2: return .dark
        default: return nil // Sistema (Automatico)
        }
    }
}
