import SwiftUI

struct Language: View {

    var body: some View {
        Button(action: {
            withAnimation {}
        }) {
            HStack(spacing: 15) {
                Image("worldMap")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.primary)
                
                Text("Lingua")
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
    Language()
}
