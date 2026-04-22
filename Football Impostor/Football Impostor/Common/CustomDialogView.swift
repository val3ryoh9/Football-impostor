import SwiftUI

struct CustomDialogView: View {
    @Binding var selectedAppearance: Int
    @Binding var mostraScelte: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Scegli Apparenza")
                .font(.headline)
                .padding(.top)

            HStack(spacing: 30) {
                opzioneTema(id: 1, icona: "sun.max.fill", etichetta: "Chiaro")
                opzioneTema(id: 2, icona: "moon.fill", etichetta: "Scuro")
                opzioneTema(id: 0, icona: "desktopcomputer", etichetta: "Auto")
            }
            .padding()

            Button("Chiudi") {
                withAnimation { mostraScelte = false }
            }
            .padding(.bottom)
        }
        .frame(maxWidth: 300)
        .background(RoundedRectangle(cornerRadius: 25).fill(Color(.systemBackground)))
        .shadow(radius: 20)
        .transition(.scale)
    }
    
    func opzioneTema(id: Int, icona: String, etichetta: String) -> some View {
        Button(action: {
            selectedAppearance = id
            withAnimation { mostraScelte = false }
        }) {
            VStack {
                Image(systemName: icona)
                    .font(.system(size: 30))
                Text(etichetta)
                    .font(.caption)
            }
            .foregroundColor(selectedAppearance == id ? .blue : .primary)
        }
    }
}
