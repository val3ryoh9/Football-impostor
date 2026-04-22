import SwiftUI

struct ContentView: View {
        
    var body: some View {
        VStack {
            IntroPage()
        }
        .onAppear {
            MusicManager.shared.playBackgroundMusic()
        }
    }
}

#Preview {
    ContentView()
}
