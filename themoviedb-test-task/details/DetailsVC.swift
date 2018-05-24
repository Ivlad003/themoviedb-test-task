import Foundation
import UIKit
import ImageSlideshow

class DetailsVC: UIViewController, ApiManagerDelegate{
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var lableTitle: UILabel!
	@IBOutlet weak var imageSlader: ImageSlideshow!
	@IBOutlet weak var loader: UIActivityIndicatorView!
	
	@IBOutlet weak var player: YTPlayerView!
	@IBOutlet weak var lableOverview: UILabel!
	private var apiManager = ApiManager()
	var model :Result?
	
	override func viewDidLoad() { 
		super.viewDidLoad()
		apiManager.delegat = self
		lableTitle.text = model?.title
		if let movieId = model?.id{
			hideView()
			apiManager.getVideosByMovieId(movieId: movieId)
			apiManager.getDeatilsByMovieId(movieId: movieId)
			apiManager.getImagesByMovieId(movieId: movieId)
		}
		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DetailsVC.didTap))
  		imageSlader.addGestureRecognizer(gestureRecognizer)
	}
	
	@objc func didTap() {
  		imageSlader.presentFullScreenController(from: self)
	}
	
	func didLoad(movieVideos: MovieVideos) {
		showView()
		if !(movieVideos.resultVideos?.isEmpty)!{
			let video = movieVideos.resultVideos![0]
			player.load(withVideoId: video.key!)
		} else{
			player.removeWebView()
			player.removeFromSuperview()
		}
	}
	
	func didLoad(movieImages: MovieImages) {
		var inputSources: [InputSource] = []
		if !(movieImages.backdrops?.isEmpty)!{
			for backdrop in (movieImages.backdrops?.prefix(20))!{
				let imageUrl = ApiManager.hostImages + backdrop.filePath!
				inputSources.append(KingfisherSource(urlString: imageUrl)!)
			}
			imageSlader.setImageInputs(inputSources)
		}else{
			imageSlader.removeFromSuperview()
		}
	}
	
	func didLoad(movieDetails: MovieDetails) {
		lableOverview.contentMode = .scaleToFill
		lableOverview.numberOfLines = 0
		lableOverview.text = movieDetails.overview
	}
	
	func hideView(){
		loader.isHidden = false
	}
	
	func showView() {
		loader.isHidden = true
	}
}
