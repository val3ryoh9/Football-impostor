import SwiftUI

struct SoundEffect: View {

    @ObservedObject var musicManager = MusicManager.shared
    
    var body: some View {
        Toggle(isOn: $musicManager.isAudioEnabled) {
            HStack(spacing: 15) {
                Image("soundIcon")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.primary)
                
                Text("Effetti Sonori")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
        }
        .padding(.horizontal, 20)
        .toggleStyle(SwitchToggleStyle(tint: .primary))
    }
}

#Preview {
    SettingsPage()
}
