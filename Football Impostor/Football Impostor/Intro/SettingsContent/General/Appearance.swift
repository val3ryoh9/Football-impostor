import SwiftUI

struct Appearance: View {
    @Binding var selectedAppearance: Int
    @Binding var mostraScelte: Bool
    
    var body: some View {
        Button(action: {
            withAnimation { mostraScelte = true }
        }) {
            HStack(spacing: 15) {
                Image("substitutionIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.primary)
                
                Text("Apparenza")
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
    Appearance(
        selectedAppearance: .constant(0),
        mostraScelte: .constant(false)
    )
}
