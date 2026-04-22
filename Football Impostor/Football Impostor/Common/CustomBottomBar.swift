import SwiftUI

struct CustomBottomBar: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 0) {
                ForEach(0..<4) { index in
                    if index == 0 {
                        NavigationLink(destination: SettingsPage()) {
                            VStack {
                                Image(systemName: "gearshape.fill")
                                    .font(.system(size: 24))
                                Text("Settings")
                                    .font(.caption)
                            }
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                        }
                    } else {
                        Button(action: {
                            print("Elemento \(index + 1) cliccato")
                        }) {
                            VStack {
                                Image(systemName: "\(index + 1).circle.fill")
                                    .font(.system(size: 24))
                                Text("Voce \(index + 1)")
                                    .font(.caption)
                            }
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
            .padding(.top, 15)
            .padding(.bottom, 35)
            .background(Color(.systemBackground))
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -2)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    NavigationStack {
        CustomBottomBar()
    }
}
