import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let loardUrl: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: loardUrl)
        uiView.load(request)
    }
}
