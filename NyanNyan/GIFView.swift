
import SwiftUI
import Gifu

struct GIFImage: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> GIFImageView {
        let imageView = GIFImageView()
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
        imageView.animate(withGIFNamed: gifName)
        return imageView
    }

    func updateUIView(_ uiView: GIFImageView, context: Context) {
        uiView.animate(withGIFNamed: gifName)
    }
}
