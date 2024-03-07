import Foundation

struct Article: Identifiable, Decodable {
    var id: String
    var title: String
    var likesCount: Int
    var url: URL
    var user: User
}

let mockArticle: [Article] = [
    Article(id: "1", title: "タイトル1", likesCount: 10, url: URL(string:"https://qiita.com/")!, user: User(id: "taro1")),
    Article(id: "2", title: "タイトル2", likesCount: 10, url: URL(string:"https://qiita.com/")!, user: User(id: "taro2")),
    Article(id: "3", title: "タイトル3", likesCount: 10, url: URL(string:"https://qiita.com/")!, user: User(id: "taro3"))
]
