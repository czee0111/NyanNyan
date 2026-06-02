import SwiftUI
import Gifu

struct PlayerConstants {
    static var playerSize: CGSize {
        return CGSize(width: 300, height: 125)
    }
    
    // WORK ON HITBOXES
    static var playerHitbox: CGSize {
        return CGSize(width: 100, height: 100)
    }
    static var playerScale = 2.5
}

struct Player: View {
    var body: some View {
        GIFImage(gifName: "nyan-cat")
            .frame(width: PlayerConstants.playerSize.width, height: PlayerConstants.playerSize.height)
    }
}

#Preview {
    Player()
}
