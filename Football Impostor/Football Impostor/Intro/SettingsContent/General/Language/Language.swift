import SwiftUI

struct Language: View {
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "it"
    @State private var showingDialog = false

    var body: some View {
        Button(action: {
            showingDialog = true
        }) {
            HStack(spacing: 15) {
                Image("worldMap")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.primary)
                
                Text("Lingua")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text(AppLanguage(rawValue: selectedLanguage)?.name ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
        }
        .padding(.horizontal, 20)
        
        .confirmationDialog("Seleziona Lingua", isPresented: $showingDialog, titleVisibility: .visible) {
            ForEach(AppLanguage.allCases, id: \.self) { language in
                Button(language.name) {
                    selectedLanguage = language.rawValue
                }
            }
        }
    }
}

#Preview {
    Language()
}
