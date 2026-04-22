import SwiftUI

struct SettingsPage: View {
    
    @AppStorage("selectedAppearance") var selectedAppearance: Int = 0
    @State private var mostraScelte = false
    @State private var mostraDialog = false

    func getScheme() -> ColorScheme? {
        switch selectedAppearance {
        case 1: return .light
        case 2: return .dark
        default: return nil
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            ScrollView {
                VStack {
                    General(selectedAppearance: $selectedAppearance, mostraScelte: $mostraScelte)
                    Feedback().padding(.top, 16)
                    FollowUs().padding(.top, 16)
                }
                .blur(radius: mostraScelte ? 5 : 0)
            }
            
            if mostraScelte {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { withAnimation { mostraScelte = false } }
                
                CustomDialogView(selectedAppearance: $selectedAppearance, mostraScelte: $mostraScelte)
            }
            
        }
        .preferredColorScheme(getScheme())
        .animation(.easeInOut(duration: 0.5), value: selectedAppearance)
    }
}


#Preview {
    SettingsPage()
}
