import SwiftUI

struct RateTheApp: View {
    let appID = "IL_TUO_ID_APP"

    var body: some View {
        Button(action: {
            openAppStoreReview()
        }) {
            HStack(spacing: 15) {
                Image("appstore")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.primary)
                
                Text("Valuta l'app")
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

    // Funzione per aprire l'App Store
    private func openAppStoreReview() {
        let urlString = "https://apple.com\(appID)?action=write-review"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    RateTheApp()
}
