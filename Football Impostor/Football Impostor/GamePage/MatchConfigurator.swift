import SwiftUI

struct MatchConfigurator: View {
    var body: some View {
        
        // BOX FOR MATCH CONFIG
        VStack(spacing: 20) {
            Text("Configurazione Partita")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Seleziona il numero di giocatori")
                .font(.system(size: 18, weight: .semibold))
                .multilineTextAlignment(.center)
            
            Divider()
            
            Button(action: {
                print("Gioco avviato")
            }) {
                Text("Avvia il gioco")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.secondarySystemGroupedBackground))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal, 20)
    }
}
