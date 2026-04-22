enum AppLanguage: String, CaseIterable {
    case italiano = "it"
    case english = "en"
    
    var name: String {
        switch self {
        case .italiano: return "Italiano"
        case .english: return "English"
        }
    }
}
