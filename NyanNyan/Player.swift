import SwiftUI

struct PlayerConstants {
    static let cellSize: CGFloat = 5
    
    static let cells: [[Color]] = [[.clear, .clear, .clear, .blue, .blue, .blue, .clear, .clear, .clear],
                                   [.clear, .clear, .blue, .blue, .red, .blue, .blue, .clear, .clear],
                                   [.clear, .blue, .blue, .blue, .blue, .blue, .blue, .blue, .clear],
                                   [.blue, .blue, .green, .blue, .red, .blue, .green, .blue, .blue],
                                   [.clear, .blue, .blue, .blue, .blue, .blue, .blue, .blue, .clear],
                                   [.clear, .clear, .blue, .blue, .blue, .blue, .blue, .clear, .clear],
                                   [.clear, .blue, .clear, .blue, .clear, .blue, .clear, .blue, .clear],
                                   [.yellow, .blue, .clear, .yellow, .clear, .yellow, .clear, .blue, .yellow]]
    
    // computed property
    static var playerSize: CGSize {
        let w = CGFloat(cells.count) * cellSize
        let h = CGFloat(cells[0].count) * cellSize
        return CGSize(width: w, height: h)
    }
}

struct Player: View {
    var body: some View {
        let rows = PlayerConstants.cells.count
        let cols = PlayerConstants.cells[0].count
        VStack (spacing: 0) {
            ForEach((0 ..< rows), id: \.self) { row in
                HStack (spacing: 0) {
                    ForEach((0 ..< cols), id: \.self) { col in
                        VStack (spacing: 0) {
                            Pixel(size: PlayerConstants.cellSize, color: PlayerConstants.cells[row][col])
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Player()
}
