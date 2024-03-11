import Foundation

struct Article: Identifiable, Decodable {
    var id: String
    var title: String
    var likesCount: Int
    var url: URL
    var user: User
}

extension Article {
    static func stub() -> Article {
        Article(id: "1", title: "タイトル", likesCount: 10, url: URL(string:"https://qiita.com/")!, user: User(id: "taro"))
    }
}
