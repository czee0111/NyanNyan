import SwiftUI

struct Obstacle2Contants {
    static let obstacle2Width = 50.0
    static let minHeight = 60.0
    static let maxHeight = 250.0
}

struct Obstacle2: View {
    let randomHeight = CGFloat.random(in: Obstacle2Contants.minHeight...Obstacle2Contants.maxHeight)
    var body: some View {
        Rectangle()
            .frame(width: Obstacle2Contants.obstacle2Width, height: randomHeight)
            .foregroundColor(.purple)
    }
}

#Preview {
    Obstacle2()
}
