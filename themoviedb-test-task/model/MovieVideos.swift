import Foundation
import Gloss

struct MovieVideos: JSONDecodable {
    var id: Int?
    var resultVideos: [ResultVideo]?
	
	init?(json: JSON) {
        self.id = "id" <~~ json
        self.resultVideos = "results" <~~ json
    }
}

struct ResultVideo: JSONDecodable  {
    var id, iso639_1, iso3166_1, key: String?
    var name, site: String?
    var size: Int?
    var type: String?
	
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.site = "site" <~~ json
        self.size = "size" <~~ json
        self.type = "type" <~~ json
        self.key = "key" <~~ json
        self.iso639_1 = "iso639_1" <~~ json
        self.iso3166_1 = "iso3166_1" <~~ json
    }
}
