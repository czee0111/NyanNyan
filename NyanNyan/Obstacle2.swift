import SwiftUI

struct Obstacle2Contants {
    static let obstacle2Width = 50.0
    static let minHeight = 10.0
    static let maxHeight = 220.0
}

struct Obstacle2: View {
    let height: CGFloat
    var body: some View {
        Rectangle()
            .frame(width: Obstacle2Contants.obstacle2Width, height: height)
            .foregroundColor(.purple)
    }
}

#Preview {
    Obstacle2(height: 150)
}
