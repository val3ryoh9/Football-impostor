import SwiftUI

struct GamePage: View {
    var body: some View {
        ZStack {
            
            VStack(spacing: 30) {
                Text("Prima di iniziare")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 40)
                
                MatchConfigurator()
                
                Spacer()
            }
        }
    }
}

#Preview {
    GamePage()
}
