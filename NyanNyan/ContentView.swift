import SwiftUI

struct ContentView: View {
    @Environment(GameModel.self) private var model: GameModel
    @State private var gameStarted = false
    
    var body: some View {
        // GeometryReader provides size of enclosing view as parameter "geo"
        // since ZStack stretches to fill screen, geo.size will be width and height of screen
        ZStack {
            if !gameStarted {
                StartScreen(gameStarted: $gameStarted)
                    .transition(.opacity)
            } else {
                GeometryReader { geo in
                    ZStack {
                        GIFImage(gifName: "spacebg")
                            .scaledToFill()
                            .ignoresSafeArea()
                        Player()
                            .position(model.playerPosition)
                            .onReceive(model.timer) {_ in
                                withAnimation {
                                    model.playerGravity(windowSize: geo.size)
                                }
                            }
                        
                        Obstacle()
                            .position(model.obstaclePosition)
                            .onReceive(model.timer) {_ in
                                if model.obstaclePosition.x > 0 {
                                    withAnimation {
                                        model.moveObstacle()
                                    }
                                } else {
                                    // pass in window size;
                                    // no animation on reset
                                    model.resetObstacle(windowSize: geo.size)
                                }
                            }
                        Obstacle2(height: model.obstacle2Height)
                            .position(model.obstacle2Position)
                            .onReceive(model.timer) { _ in
                                if model.obstacle2Position.x > 0 {
                                    withAnimation {
                                        model.moveObstacle2()
                                    }
                                } else {
                                    model.resetObstacle2(windowSize: geo.size)
                                }
                            }
                        
                        Text(model.score, format: .number.rounded(increment: 1.0))
                            .foregroundColor(.white)
                        // place the score in top right corner:
                        // x = 90% of screen width, y = 10% of screen height
                            .position(x: geo.size.width * 0.9, y: geo.size.height * 0.1 )
                            .font(.system(size: 24))
                        
                        if model.gameOver {
                            Button("Play Again") {
                                model.reset()
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    .background(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.8))  // dark gray
                    .gesture(
                        TapGesture()
                            .onEnded {
                                if !model.gameOver {
                                    withAnimation{
                                        model.movePlayerOnTap(windowSize: geo.size)
                                    }
                                }
                            })
                    
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview(traits: .landscapeLeft) {
    ContentView()
        .environment(GameModel())
}
