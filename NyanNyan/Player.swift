import SwiftUI
import Gifu

struct PlayerConstants {
    static var playerSize: CGSize {
        let w = CGFloat(50)
        let h = CGFloat(50)
    }
}

struct Player: View {
    let playerSize = PlayerConstants()
    
    // FIX & CHECK
    var body: some View {
        GIFImage(gifName: "nyan-cat")
            .frame(width: PlayerConstants.playerSize.w, height: PlayerConstants.playerSize.h)
    }
}

#Preview {
    Player()
}
