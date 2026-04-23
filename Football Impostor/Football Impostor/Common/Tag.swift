import SwiftUI

struct Tag: View {
    let text: String
    let color: Color
    var number: Int? = nil
    var body: some View {
        Text(number.map { "\($0) \(text)" } ?? text)
            .font(.system(.subheadline, design: .rounded)).bold()
            .padding(.horizontal, 15).padding(.vertical, 5)
            .background(Capsule().fill(color.opacity(0.2)))
            .foregroundColor(color)
    }
}
