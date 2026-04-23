import SwiftUI

struct MatchConfigurator: View {
    
    @AppStorage("selected_players") private var selectedPlayers: Double = 4
    @AppStorage("selected_undercovers") private var selecterImpostor: Double = 1
    @AppStorage("selected_mr_white") private var selectedMrWhite: Double = 0
    
    // Questa variabile si aggiorna da sola ogni volta che selectedPlayers cambia
    var configPlayer: PlayerCalculatorProps {
        calculatePlayers(player: Int(selectedPlayers))
    }
    
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
            
            VStack(spacing: 20) {
                Text("Giocatori selezionati: \(Int(selectedPlayers))")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.top, 40)
                
                Slider(value: $selectedPlayers, in: 4...20).padding()
            }
            
            VStack {
                
                HStack {
                    Spacer()
                    Tag(text: "Onesti", color: Color.blue, number: configPlayer.civilians)
                    Spacer()
                }.padding(.top, 16)
                
                HStack {
                    Spacer()
                    Tag(text: "Impostore", color: Color.red, number: configPlayer.impostor)
                    Spacer()
                }.padding(.top, 16)
                
                HStack {
                    Spacer()
                    Tag(text: "Mr. White", color: Color.black, number: configPlayer.mrWhite)
                    Spacer()
                }.padding([.top, .bottom], 16)
                
            }.background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.secondarySystemGroupedBackground))
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            )
            .padding([.leading, .trailing], 30)
            
            Spacer()
            
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
        .padding(.horizontal, 20)
        
    }
}

#Preview {
    MatchConfigurator()
}
