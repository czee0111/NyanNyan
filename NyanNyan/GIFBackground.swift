import SwiftUI

struct GIFBackground: View {
    let gifName: String
    
    var body: some View {
        GeometryReader { geo in
            GIFImage(gifName: gifName)
                .frame(width: geo.size.width, height: geo.size.height)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    GIFBackground(gifName: "spacebg")
}
