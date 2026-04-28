import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double
    var range: ClosedRange<Double>
    var imageName: String

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let thumbSize: CGFloat = 30
            
            let percentage = CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound))
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 4)
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: width * percentage, height: 4)
                    .cornerRadius(16)
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: thumbSize, height: thumbSize)
                    .background(Circle().fill(Color.clear).shadow(radius: 1))
                    .offset(x: (width - thumbSize) * percentage)
                    .gesture(
                        DragGesture(minimumDistance: 0).onChanged { drag in
                            self.updateValue(dragValue: drag, width: width, thumbSize: thumbSize)
                        }
                    )
            }
            .cornerRadius(1)
        }
        .frame(height: 30)
    }

    private func updateValue(dragValue: DragGesture.Value, width: CGFloat, thumbSize: CGFloat) {
        let newValue = Double(dragValue.location.x / width) * (range.upperBound - range.lowerBound) + range.lowerBound
        self.value = min(max(range.lowerBound, newValue), range.upperBound)
    }
}

#Preview {
    @Previewable @State var previewValue: Double = 8
    
    CustomSlider(
        value: $previewValue,
        range: 4...20,
        imageName: "soccer-ball-nobg"
    )
    .padding()
}
