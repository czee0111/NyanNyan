
import SwiftUI
import WebKit

// fix this!! try to use url to display gifs
// https://bleepingswift.com/blog/gif-image-view

struct GIFView: UIViewRepresentable {
    private let url: URL

        init(url: URL) {
            self.url = url
        }

        func makeUIView(context: Context) -> WKWebView {
            let webview = WKWebView()

            webview.allowsLinkPreview = false
            webview.allowsBackForwardNavigationGestures = false

            webview.load(URLRequest(url: url))

            return webview
        }

        func updateUIView(_ uiView: WKWebView, context: Context) {
            uiView.reload()
        }
    }
