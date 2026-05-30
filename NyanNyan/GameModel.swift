import Foundation
import Combine

struct ModelConstants {
    static let playerStart = CGPoint(x: 100, y: 0)
    static let obstacleStart = CGPoint(x: 0, y: 0)
    static let obstacle2Start = CGPoint(x: 0, y: 0)
    static let gravityChangeAmt = 20.0
    static let playerMoveAmt = 100.0
    static let obstacleMoveAmt = 20.0
    static let obstacle2MoveAmt = 50.0
}

@Observable
class GameModel {
    private(set) var playerPosition = ModelConstants.playerStart
    private(set) var obstaclePosition = ModelConstants.obstacleStart
    private(set) var obstacle2Position = ModelConstants.obstacle2Start
    private(set) var gameOver = false
    private(set) var score = 0.0
    private(set) var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    private(set) var obstacle2Height = Obstacle2Contants.minHeight
    private(set) var obstacle2AttachedToTop = true
    
    func playerGravity(windowSize: CGSize) {
        let maxY = windowSize.height - PlayerConstants.playerSize.height / 2
        playerPosition.y = min(
            playerPosition.y + ModelConstants.gravityChangeAmt, maxY)
    }

    func movePlayerOnTap(windowSize: CGSize) {
        let minY = PlayerConstants.playerSize.height / 2
        playerPosition.y = max(
            playerPosition.y - ModelConstants.playerMoveAmt, minY)
    }
    
    func moveObstacle() {
        obstaclePosition.x -= ModelConstants.obstacleMoveAmt
        detectCollision();
        detectCollision2();
        score += 0.1
    }
    func moveObstacle2() {
        obstacle2Position.x -= ModelConstants.obstacle2MoveAmt
        detectCollision();
        detectCollision2();
        score += 0.1
    }
    
    func resetObstacle(windowSize: CGSize) {
        let resetX = windowSize.width + ObstacleContants.obstacleWidth
        obstaclePosition.x = resetX
        
        // reset obstacle's y value to a random number
        let yMin = ObstacleContants.obstacleHeight / 2
        let yMax = windowSize.height - yMin
        let resetY = CGFloat.random(in: yMin...yMax)
        obstaclePosition.y = resetY
    }
    
    func resetObstacle2(windowSize: CGSize) {
        let resetX = windowSize.width + 80.0
        obstacle2Position.x = resetX

        obstacle2Height = CGFloat.random(in: Obstacle2Contants.minHeight...Obstacle2Contants.maxHeight)
        let attachedToTop = Bool.random()

        if attachedToTop {
            obstacle2Position.y = ObstacleContants.obstacleHeight / 2
        } else {
            obstacle2Position.y =
                windowSize.height - ObstacleContants.obstacleHeight / 2
        }
    }
    
    func reset() {
        timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        playerPosition = CGPoint(x: 100, y: 100) // player to starting position
        obstaclePosition.x = 1000 // obstacle to starting position
        gameOver = false
        score = 0
    }
    
    private func detectCollision() {
        let playerRightEdgeX = playerPosition.x + PlayerConstants.playerSize.width / 2
        let playerLeftEdgeX = playerPosition.x - PlayerConstants.playerSize.width / 2
        let playerTopY = playerPosition.y - PlayerConstants.playerSize.height / 2
        let playerBottomY = playerPosition.y + PlayerConstants.playerSize.height / 2
        
        let obstacleRightEdgeX = obstaclePosition.x + ObstacleContants.obstacleWidth / 2
        let obstacleLeftEdgeX = obstaclePosition.x - ObstacleContants.obstacleWidth / 2
        let obstacleTopY = obstaclePosition.y - ObstacleContants.obstacleHeight  / 2
        let obstacleBottomY = obstaclePosition.y + ObstacleContants.obstacleHeight / 2
        
        let frontEdgeCheck: Bool = playerRightEdgeX >= obstacleLeftEdgeX
        let backEdgeCheck: Bool = playerLeftEdgeX <= obstacleRightEdgeX
        let topCheck: Bool = playerTopY >= obstacleTopY && playerTopY <= obstacleBottomY
        let bottomCheck: Bool = playerBottomY <= obstacleBottomY && playerBottomY >= obstacleTopY
        
        if frontEdgeCheck && backEdgeCheck && (topCheck || bottomCheck) {
            stopTimer()
            gameOver = true
        }
    }
    private func detectCollision2() {
        let playerRightEdgeX = playerPosition.x + PlayerConstants.playerSize.width / 2
        let playerLeftEdgeX = playerPosition.x - PlayerConstants.playerSize.width / 2
        let playerTopY = playerPosition.y - PlayerConstants.playerSize.height / 2
        let playerBottomY = playerPosition.y + PlayerConstants.playerSize.height / 2
        
        let obstacle2RightEdgeX = obstacle2Position.x + Obstacle2Contants.obstacle2Width / 2
        let obstacle2LeftEdgeX = obstacle2Position.x - Obstacle2Contants.obstacle2Width / 2
        let obstacle2TopY = obstacle2Position.y + obstacle2Height / 2
        let obstacle2BottomY = obstacle2Position.y + obstacle2Height / 2
        
        let frontEdgeCheck: Bool = playerRightEdgeX >= obstacle2LeftEdgeX
        let backEdgeCheck: Bool = playerLeftEdgeX <= obstacle2RightEdgeX
        let topCheck: Bool = playerTopY >= obstacle2TopY && playerTopY <= obstacle2BottomY
        let bottomCheck: Bool = playerBottomY <= obstacle2BottomY && playerBottomY >= obstacle2TopY
        
        if frontEdgeCheck && backEdgeCheck && (topCheck || bottomCheck) {
            stopTimer()
            gameOver = true
        }
    }
    
    private func stopTimer() {
        timer.upstream.connect().cancel()
    }
}
