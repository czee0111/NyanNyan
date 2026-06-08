import SwiftUI

struct StartScreen: View {
    @Binding var gameStarted: Bool
    
    var body: some View {
        ZStack {
            GIFImage(gifName: "spacebg")
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("NYAN NYAN")
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 10)
                
                Text("SPACE ADVENTURE")
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .foregroundColor(.yellow)
                    .shadow(color: .orange, radius: 5)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        gameStarted = true
                    }
                }) {
                    Text("START GAME")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                        .background(
                            LinearGradient(
                                colors: [.purple, .pink],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(15)
                        .shadow(color: .purple, radius: 10)
                }
            }
            .padding()
        }
    }
}


#Preview {
    StartScreen(gameStarted: .constant(false))
}
