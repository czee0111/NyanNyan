import SwiftUI

struct Obstacle2: View {
    let randomWidth = CGFloat.random(in: 40...120)
    let randomHeight = CGFloat.random(in: 80...250)
    var body: some View {
        Rectangle()
            .frame(width: randomWidth, height: randomHeight)
            .foregroundColor(.purple)
    }
}

#Preview {
    Obstacle2()
}
