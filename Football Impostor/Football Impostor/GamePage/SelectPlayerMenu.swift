import SwiftUI

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else { return nil }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else { return "[]" }
        return result
    }
}

struct SelectPlayerMenu: View {
    @AppStorage("selected_players") private var selectedPlayers: Double = 4
    
    // Questo array salva i nomi in formato JSON nella memoria del telefono
    @AppStorage("player_names") private var playerNames: [String] = []

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack {
            Text("Seleziona i giocatori")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 20)
                .foregroundStyle(LinearGradient(colors: [.green, .black], startPoint: .topLeading, endPoint: .bottomTrailing))

            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<Int(selectedPlayers), id: \.self) { index in
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Giocatore \(index + 1)")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            // TextField per inserire il nome
                            TextField("Inserisci nome", text: Binding(
                                get: {
                                    // Se l'array è più corto dell'indice, restituisci stringa vuota
                                    index < playerNames.count ? playerNames[index] : ""
                                },
                                set: { newValue in
                                    // Aggiorna l'array e salva automaticamente
                                    updateName(at: index, with: newValue)
                                }
                            ))
                            .font(.headline)
                            .textFieldStyle(.plain)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.secondarySystemGroupedBackground))
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                        )
                    }
                }
                .padding(20)
            }
        }
        .onAppear {
            setupPlayerList()
        }
    }

    // Funzione per assicurarsi che l'array abbia abbastanza posti
    private func setupPlayerList() {
        let count = Int(selectedPlayers)
        if playerNames.count < count {
            let missing = count - playerNames.count
            playerNames.append(contentsOf: Array(repeating: "", count: missing))
        }
    }

    // Funzione per aggiornare il nome specifico
    private func updateName(at index: Int, with name: String) {
        if index < playerNames.count {
            playerNames[index] = name
        }
    }
}

#Preview {
    SelectPlayerMenu()
}
