import Foundation

//Use of keypath
struct Article {
    let id: UUID
    let source: String
    let title: String
    let body: String
    
    init(id: UUID, source: String, title: String, body: String) {
        self.id = id
        self.body = body
        self.title = title
        self.source = source
    }
}

func getArticles() -> [Article] {
    var articles: [Article] = [Article]()
    for i in 0...9 {
        articles.append(Article.init(id: UUID.init(), source: "source of \(i)", title: "Article #\(i)", body: "Hello people from Article #\(i)"))
    }
    return articles
}

//we want to get a new array with all the ids and another with all titles

//Way #1 using map
let articles = getArticles()
let allIds = articles.map{$0.id}
let allTitles = articles.map{$0.title}

// Way #2 using key paths by creating an extension of sequence.
extension Sequence {
    func map<T>(_ path: KeyPath<Element, T>) -> [T] {
        return map {$0[keyPath: path]}
    }
}
let allIdsUsingKeyPaths = articles.map(\.id)
let allTitleUsingKeyPaths = articles.map(\.title)

