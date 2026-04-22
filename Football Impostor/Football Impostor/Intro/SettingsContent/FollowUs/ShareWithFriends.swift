import SwiftUI

struct ShareWithFriends: View {

    var body: some View {
        Button(action: {
            withAnimation {}
        }) {
            HStack(spacing: 15) {
                Image("shareFace")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.primary)
                
                Text("Condividi con gli amici")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    SettingsPage()
}
