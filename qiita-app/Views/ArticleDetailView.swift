import SwiftUI

struct ArticleDetailView: View {
    let article: Article

    var body: some View {
        WebView(loardUrl: article.url)
    }
}

#Preview {
    ArticleDetailView(article: .stub())
}
