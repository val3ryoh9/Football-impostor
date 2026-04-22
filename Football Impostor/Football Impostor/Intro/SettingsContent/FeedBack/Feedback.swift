import SwiftUI

struct Feedback: View {

    var body: some View {
        VStack(alignment: .leading) {
            Text("Feedback")
                .font(.system(size: 25, weight: .bold))
                .padding(.horizontal, 20)
            
            RateTheApp()
            Questions()
        }
    }
}

#Preview {
    SettingsPage()
}
