import SwiftUI
import Gifu

struct PlayerConstants {
    static var playerSize: CGSize {
        return CGSize(width: 300, height: 100)
    }
    
    static var playerScale = 2.5

    // WORK ON HITBOXES
    static var playerHitbox: CGSize {
        return CGSize(width: 28 * playerScale, height: 20 * playerScale)
    }
    
    static var hitboxOffset = 30 * PlayerConstants.playerScale
}

struct Player: View {
    var body: some View {
        
        // HITBOX
//        Color.blue.ignoresSafeArea()
//            .frame(width: PlayerConstants.playerHitbox.width, height: PlayerConstants.playerHitbox.height)
//            .offset(x: PlayerConstants.hitboxOffset)
        
        GIFImage(gifName: "nyan-cat")
            .frame(width: PlayerConstants.playerSize.width, height: PlayerConstants.playerSize.height)
    }
}

#Preview {
    Player()
}
