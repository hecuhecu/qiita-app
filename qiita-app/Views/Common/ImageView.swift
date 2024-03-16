import SwiftUI

struct ImageView: View {
    var url: URL
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
        } placeholder: {
            Rectangle().fill(Color.gray)
        }
    }
}

#Preview {
    ImageView(url: URL(string: "https://qiita.com/")!)
}
