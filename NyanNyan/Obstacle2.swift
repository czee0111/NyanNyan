import SwiftUI

struct Obstacle2: View {
    let randomHeight = CGFloat.random(in: 30...100)
    var body: some View {
        Rectangle()
            .frame(width: 80.0, height: randomHeight)
            .foregroundColor(.purple)
    }
}

#Preview {
    Obstacle2()
}
