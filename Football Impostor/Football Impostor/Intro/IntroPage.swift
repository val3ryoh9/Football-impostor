import SwiftUI

struct IntroPage: View {
    
    @EnvironmentObject var theme: ThemeManager
    
    var body: some View {
        
        // usato per permettere agli elementi di navigare tra pagine diverse
        NavigationStack {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            NavigationLink(destination: MatchConfigurator()) {
                                Text("Avvia il gioco")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(Color(.systemBackground))
                                    .cornerRadius(10)
                            }.glassEffect(.regular.interactive().tint(.green))
                        }
                    }
                    
                    CustomBottomBar()
                }
            }
        }.preferredColorScheme(theme.selectedScheme)
    }
}

#Preview {
    IntroPage().environmentObject(ThemeManager())
}
