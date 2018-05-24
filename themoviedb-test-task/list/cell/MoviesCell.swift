import Foundation
import UIKit

class MoviesCell: UITableViewCell, ApiManagerDelegate{
	
	private let apiManager = ApiManager()
	
	@IBOutlet weak var icon: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var releaseDateLabel: UILabel!
	
	var model :Result? = nil{
		didSet{
			apiManager.delegat = self
			apiManager.getImagesByMovieId(movieId: (model?.id)!)
			titleLabel.text = model?.title
			releaseDateLabel.text = model?.overview
		}
	}
	
	func didLoad(movieImages: MovieImages) {
		var filePath = ""
		if !(movieImages.backdrops?.isEmpty)! {
			filePath = movieImages.backdrops![0].filePath!
		} else if !(movieImages.posters?.isEmpty)! {
			filePath = movieImages.posters![0].filePath!
		}
		icon.downloadedFrom(link: filePath)
	}
}
