import SwiftUI

struct ArticleRowView: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .bold()
                .font(.headline)
                .padding(.bottom, 2)

            HStack {
                Text("@" + article.user.id)
                    .font(.footnote)
                    .padding(.trailing, 2)

                Image(systemName: "hand.thumbsup")
                Text(String(article.likesCount))
            }
        }
    }
}

#Preview {
    ArticleRowView(article: mockArticle[0])
}
