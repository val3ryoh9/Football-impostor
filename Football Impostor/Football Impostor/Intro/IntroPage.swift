import SwiftUI

struct IntroPage: View {
        
    var body: some View {
        
        // usato per permettere agli elementi di navigare tra pagine diverse
        NavigationStack {
            ZStack {
                Color.indigo.ignoresSafeArea() // usato per colorare anche dietro il notch
                
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Button(action: {}) {
                                Text("Avvia il gioco")
                                    .font(.headline)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(.indigo)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    CustomBottomBar()
                }
            }
        }
    }
}

#Preview {
    IntroPage()
}
