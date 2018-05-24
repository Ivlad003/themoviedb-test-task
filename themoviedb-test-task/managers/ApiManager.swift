import Foundation
import Alamofire

class ApiManager {
	static let hostImages = "https://image.tmdb.org/t/p/w500"
    weak var delegat: ApiManagerDelegate?
	
	var parameters: Parameters = ["api_key": "67f112abe8ee9fa9c4d59afb726a2eb2"]
	
	func feachMoviesByPage(page: Int){
		parameters["page"] = page
		Alamofire.request(RequestAddress.ServerPath.movies.address(),parameters: parameters).responseJSON { response in
			if let data = response.data {
				let object = ModelPageWithMovies(data: data)
				if let model = object{
					self.delegat?.didLoad(modelPageWithMovies: model)
				}
			}
		}
	}
	
	func getDeatilsByMovieId(movieId: Int){
		Alamofire.request(RequestAddress.ServerPath.deatils(movieId).address(),parameters: parameters).responseJSON { response in
				if let data = response.data {
					let object = MovieDetails(data: data)
					if let model = object{
						self.delegat?.didLoad(movieDetails: model)
					}
				}
		}
	}
	
	func getVideosByMovieId(movieId: Int){
		Alamofire.request(RequestAddress.ServerPath.videos(movieId).address(),parameters: parameters).responseJSON { response in
			if let data = response.data {
					let object = MovieVideos(data: data)
					if let model = object{
						self.delegat?.didLoad(movieVideos: model)
					}
				}
		}
	}
	
	func searchMovies(query: String){
		parameters["query"] = query
		Alamofire.request(RequestAddress.ServerPath.search.address(),parameters: parameters).responseJSON { response in
			if let data = response.data{
				let object = ModelPageWithMovies(data: data)
				if let model = object{
					self.delegat?.didLoad(modelPageWithMovies: model)
				}
			}
		}
	}
	
	func getImagesByMovieId(movieId: Int){
		Alamofire.request(RequestAddress.ServerPath.images(movieId).address(),parameters: parameters).responseJSON { response in
			if let data = response.data {
				let object = MovieImages(data: data)
				if let model = object{
					self.delegat?.didLoad(movieImages: model)
				}
			}
		}
	}
	
	struct RequestAddress {
        enum ServerPath {
            fileprivate var currentServer: Server { return .production }
            case movies
            case deatils(Int)
            case videos(Int)
            case images(Int)
            case search
			
            func address() -> String {
                var resultAddress = currentServer.rawValue
                switch self {
               	 	case .movies: resultAddress += "movie/popular"
                	case .deatils(let movie_id): resultAddress += "movie/\(movie_id)"
                	case .videos(let movie_id): resultAddress += "movie/\(movie_id)/videos"
                	case .images(let movie_id): resultAddress += "movie/\(movie_id)/images"
                	case .search: resultAddress += "search/movie"
					
                }
                return resultAddress
            }
        }
        fileprivate enum Server: String {
            case production = "https://api.themoviedb.org/3/"
            case test = ""
        }
    }
}

protocol ApiManagerDelegate : class {
	 func didLoad(modelPageWithMovies: ModelPageWithMovies)
	 func didLoad(movieImages: MovieImages)
	 func didLoad(movieVideos: MovieVideos)
	 func didLoad(movieDetails: MovieDetails)
}

extension ApiManagerDelegate{
 	func didLoad(modelPageWithMovies: ModelPageWithMovies){
	
	}
	
	func didLoad(movieImages: MovieImages){
		
	}
	
	func didLoad(movieVideos: MovieVideos){
		
	}
	
	func didLoad(movieDetails: MovieDetails){
		
	}
}
