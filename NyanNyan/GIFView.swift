
import SwiftUI
import WebKit

// fix this!! try to use url to display gifs
// https://bleepingswift.com/blog/gif-image-view

struct GIFView: UIViewRepresentable {
    private let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.allowsLinkPreview = false
        
        if let path = Bundle.main.path(forResource: "\(name)", ofType: "gif") {
            let url = URL(fileURLWithPath: path)
            let data = try? Data(contentsOf: url)
            
            webView.load(data!, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: url.deletingLastPathComponent())
        }
        return webView
    }
        
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}
