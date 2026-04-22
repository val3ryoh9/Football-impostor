import SwiftUI

struct Questions: View {

    var body: some View {
        Button(action: {
            sendEmail()
        }) {
            HStack(spacing: 15) {
                Image("questionIcon")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.primary)
                
                Text("Domande")
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

    private func sendEmail() {
        let email = "valerio9f@gmail.com"
        let subject = "Football Impostor Question/Bug"
        
        // Creiamo la stringa dell'URL
        let urlString = "mailto:\(email)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        
        guard let url = URL(string: urlString) else { return }
        
        // Proviamo ad aprire l'URL senza il controllo preventivo (utile per il debug)
        UIApplication.shared.open(url) { success in
            if !success {
                print("Errore: Impossibile aprire l'app Mail. Assicurati che sia installata e configurata.")
            }
        }
    }
}

#Preview {
    Questions()
}
