import Foundation
import Gloss

struct MovieDetails: JSONDecodable {
    var adult: Bool?
    var backdropPath: String?
    var belongsToCollection: BelongsToCollection?
    var budget: Int?
    var genres: [Genre]?
    var homepage: NSNull?
    var id: Int?
    var imdbID, originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath: String?
    var productionCompanies: [ProductionCompany]?
    var productionCountries: [ProductionCountry]?
    var releaseDate: String?
    var revenue, runtime: Int?
    var spokenLanguages: [SpokenLanguage]?
    var status, tagline, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
	
    init?(json: JSON) {
        self.adult = "adult" <~~ json
        self.backdropPath = "backdropPath" <~~ json
        self.belongsToCollection = "belongsToCollection" <~~ json
        self.budget = "budget" <~~ json
        self.genres = "genres" <~~ json
        self.homepage = "homepage" <~~ json
        self.id = "id" <~~ json
        self.imdbID = "imdbID" <~~ json
        self.originalLanguage = "originalLanguage" <~~ json
        self.originalTitle = "originalTitle" <~~ json
        self.overview = "overview" <~~ json
        self.popularity = "popularity" <~~ json
        self.posterPath = "posterPath" <~~ json
        self.productionCompanies = "productionCompanies" <~~ json
        self.releaseDate = "releaseDate" <~~ json
        self.revenue = "revenue" <~~ json
        self.runtime = "runtime" <~~ json
        self.spokenLanguages = "spokenLanguages" <~~ json
        self.status = "status" <~~ json
        self.tagline = "tagline" <~~ json
        self.title = "title" <~~ json
		self.video = "video" <~~ json
		self.voteAverage = "voteAverage" <~~ json
		self.voteCount = "voteCount" <~~ json
    }
}

struct BelongsToCollection: JSONDecodable {
    var id: Int?
    var name, posterPath, backdropPath: String?
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.posterPath = "posterPath" <~~ json
        self.backdropPath = "backdropPath" <~~ json
    }
}

struct Genre: JSONDecodable {
    var id: Int?
    var name: String?
	init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
    }
}

struct ProductionCompany: JSONDecodable {
    var id: Int?
    var logoPath: String?
    var name, originCountry: String?
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.logoPath = "logoPath" <~~ json
        self.name = "name" <~~ json
        self.originCountry = "originCountry" <~~ json
    }
}

struct ProductionCountry: JSONDecodable {
    var iso3166_1, name: String?
    init?(json: JSON) {
        self.iso3166_1 = "iso3166_1" <~~ json
        self.name = "name" <~~ json
    }
}

struct SpokenLanguage: JSONDecodable {
    var iso639_1, name: String?
    init?(json: JSON) {
        self.iso639_1 = "iso639_1" <~~ json
        self.name = "name" <~~ json
    }
}
