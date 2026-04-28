import SwiftUI

struct MatchConfigurator: View {
    
    @AppStorage("selected_players") private var selectedPlayers: Double = 4
    @AppStorage("selected_impostor") private var selectedImpostor: Double = 1
    @AppStorage("selected_mr_white") private var selectedMrWhite: Double = 0
    
    private var displayPlayers: Int {
        Int(selectedPlayers)
    }
    
    private var fixedCivilians: Int {
        calculatePlayers(player: Int(selectedPlayers)).civilians
    }
    
    private var totalSpecialRoles: Int {
        Int(selectedPlayers) - fixedCivilians
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Configurazione Partita")
                .font(.headline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 20) {
                Text("Giocatori selezionati: \(displayPlayers)")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.top, 40)
                
                CustomSlider(value: $selectedPlayers, range: 4...20, imageName: "soccer-ball-nobg")
                    .padding()
                    .onChange(of: selectedPlayers) { oldValue, newValue in
                        let config = calculatePlayers(player: Int(newValue))
                        selectedImpostor = Double(config.impostor)
                        selectedMrWhite = Double(config.mrWhite)
                    }
            }
            
            VStack {
                HStack {
                    Spacer()
                    Tag(text: "Onesti", color: Color.green, number: fixedCivilians)
                    Spacer()
                }.padding(.top, 16)
                
                HStack {
                    Spacer()
                    specialRoleStepper(
                        value: $selectedImpostor,
                        linkedValue: $selectedMrWhite,
                        label: "Impostore",
                        color: .red
                    )
                    Spacer()
                }.padding(.top, 16)
                
                HStack {
                    Spacer()
                    specialRoleStepper(
                        value: $selectedMrWhite,
                        linkedValue: $selectedImpostor,
                        label: "Mr. White",
                        color: .black
                    )
                    Spacer()
                }.padding([.top, .bottom], 16)
                
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.secondarySystemGroupedBackground))
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            )
            .padding([.leading, .trailing], 30)
            
            Spacer()
            
            Button(action: { print("Gioco avviato") }) {
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
    }
    
    // Funzione per gestire lo scambio tra Impostore e Mr White
    @ViewBuilder
    private func specialRoleStepper(value: Binding<Double>, linkedValue: Binding<Double>, label: String, color: Color) -> some View {
        HStack(spacing: 15) {
            
            Button(action: {
                if value.wrappedValue > 0 {
                    value.wrappedValue -= 1
                    linkedValue.wrappedValue += 1
                }
            }) {
                Image(systemName: "minus.circle.fill")
                    .font(.title2)
            }
            .disabled(value.wrappedValue <= 0)
            
            Tag(text: label, color: color, number: Int(value.wrappedValue))
            
            Button(action: {
                if linkedValue.wrappedValue > 0 {
                    value.wrappedValue += 1
                    linkedValue.wrappedValue -= 1
                }
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
            }
            .disabled(linkedValue.wrappedValue <= 0)
        }
    }
}

#Preview {
    MatchConfigurator()
}
