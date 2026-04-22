import SwiftUI

struct General: View {
    @Binding var mostraScelte: Bool
    
    var body: some View {
        
            
            VStack(alignment: .leading) {
                
                Text("Generale")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                
                Appearance(mostraScelte: $mostraScelte)
                
                Language()
                
                SoundEffect()
                
                DeleteAllPlayers()
                
                Spacer()
            }
        
    }
}

#Preview {
    NavigationStack {
        SettingsPage()
    }
}
