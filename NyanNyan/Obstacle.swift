import SwiftUI

struct ObstacleContants {
    static let obstacleWidth = 40.0
    static let obstacleHeight = 200.0
}

struct Obstacle: View {
    var body: some View {
        Rectangle()
            .frame(width: ObstacleContants.obstacleWidth, height: ObstacleContants.obstacleHeight)
            .foregroundColor(Color.green)
    }
}

#Preview {
    Obstacle()
}
