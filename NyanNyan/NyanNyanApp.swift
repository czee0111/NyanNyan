
import SwiftUI

@main
struct NyanNyanApp: App {
    @State private var gameModel = GameModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(gameModel)
        }
    }
}
