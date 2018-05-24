import Foundation
import Gloss

struct ModelPageWithMovies: JSONDecodable {
    var page, totalResults, totalPages: Int?
    var results: [Result]?

	init?(json: JSON) {
        self.page = "page" <~~ json
        self.totalResults = "totalResults" <~~ json
        self.totalPages = "totalPages" <~~ json
        self.results = "results" <~~ json
    }

    init(page: Int?, totalResults: Int?, totalPages: Int?, results: [Result]?) {
        self.page = page
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.results = results
    }
}

struct Result : JSONDecodable{
	var id: Int?
    var video: Bool?
    var title: String?
    var overview: String?

	init?(json: JSON) {
        self.id = "id" <~~ json
        self.video = "video" <~~ json
        self.title = "title" <~~ json
        self.overview = "overview" <~~ json
    }

    init(voteCount: Int?, id: Int?, video: Bool?,  title: String?,  overview: String?) {
        self.id = id
        self.video = video
        self.title = title
        self.overview = overview
    }
}
