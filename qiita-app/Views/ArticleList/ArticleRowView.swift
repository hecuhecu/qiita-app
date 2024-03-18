import SwiftUI

struct ArticleRowView: View {
    let article: Article

    var body: some View {
        HStack {
            ImageView(url: article.user.profileImageUrl)
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(article.title)
                    .font(.system(size: 14, weight: .medium))

                HStack {
                    Text("@" + article.user.id)
                        .foregroundStyle(.secondary)
                        .font(.system(size: 12))

                    Image(systemName: "hand.thumbsup")
                        .frame(width: 4, height: 12)
                        .font(.system(size: 12))

                    Text(String(article.likesCount))
                        .foregroundStyle(.secondary)
                        .font(.system(size: 12))
                }
            }
        }
    }
}

#Preview {
    ArticleRowView(article: .stub())
}
