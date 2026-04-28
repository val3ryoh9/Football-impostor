import SwiftUI

struct SettingsPage: View {
    
    @EnvironmentObject var theme: ThemeManager
    @State private var mostraScelte = false
    @State private var mostraDialog = false
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            ScrollView {
                VStack {
                    General(mostraScelte: $mostraScelte)
                    Feedback().padding(.top, 16)
                    FollowUs().padding(.top, 16)
                }
                .blur(radius: mostraScelte ? 5 : 0)
            }
            
            if mostraScelte {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { withAnimation { mostraScelte = false } }
                
                CustomDialogView(selectedAppearance: theme.$selectedAppearance, mostraScelte: $mostraScelte)
            }
            
        }
        .preferredColorScheme(theme.selectedScheme)
        .animation(.easeInOut(duration: 0.5), value: theme.selectedAppearance)
    }
}


#Preview {
    SettingsPage().environmentObject(ThemeManager())
}
