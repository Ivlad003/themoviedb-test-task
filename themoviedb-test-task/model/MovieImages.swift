import Foundation
import Gloss

class MovieImages: JSONDecodable {
    var id: Int?
    var backdrops, posters: [Backdrop]?
	
	required init?(json: JSON) {
        self.id = "id" <~~ json
        self.backdrops = "backdrops" <~~ json
        self.posters = "posters" <~~ json
    }
}

class Backdrop: JSONDecodable {
    var filePath: String?
    var height: Int?
    var width: Int?
	
	required init?(json: JSON) {
        self.filePath = "file_path" <~~ json
        self.height = "height" <~~ json
        self.width = "width" <~~ json
    }
}

