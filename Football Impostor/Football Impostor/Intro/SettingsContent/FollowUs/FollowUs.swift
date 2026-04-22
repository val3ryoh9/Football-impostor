import SwiftUI

struct FollowUs: View {

    var body: some View {
        VStack(alignment: .leading) {
            Text("Seguici")
                .font(.system(size: 25, weight: .bold))
                .padding(.horizontal, 20)
            
            Instagram()
            ShareWithFriends()
        }
    }
}

#Preview {
    SettingsPage()
}
