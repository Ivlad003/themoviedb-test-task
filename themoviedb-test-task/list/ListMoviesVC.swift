import UIKit

class ListMoviesVC: UIViewController, ApiManagerDelegate, UITableViewDelegate, UITableViewDataSource{
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var search: UITextField!
	@IBOutlet weak var loader: UIActivityIndicatorView!
	
	private let apiManager = ApiManager()
	private var modelPageWithMovies: ModelPageWithMovies?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		tableView.delegate = self
		tableView.dataSource = self
		tableView.estimatedRowHeight = 100
        tableView.rowHeight = 100
		apiManager.delegat = self
		hideView()
		apiManager.feachMoviesByPage(page: 1)
		search.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
	}
	
	@objc func textFieldDidChange(_ textField: UITextField) {
		let query = textField.text
		if (query?.isEmpty)! {
			hideView()
			apiManager.feachMoviesByPage(page: 1)
		}else{
			if let text = query{
				hideView()
				apiManager.searchMovies(query: text)
			} else{
				hideView()
				apiManager.feachMoviesByPage(page: 1)
			}
		}
	}
	
	func hideView(){
		search.isHidden = true
		loader.isHidden = false
	}
	
	func showView() {
		search.isHidden = false
		loader.isHidden = true
	}
	
	func didLoad(modelPageWithMovies: ModelPageWithMovies) {
		DispatchQueue.main.async() {
			self.modelPageWithMovies = modelPageWithMovies
			self.tableView.reloadData()
			self.showView()
    	}
	}
}

extension ListMoviesVC{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if modelPageWithMovies != nil {
			return (modelPageWithMovies?.results?.count)!
		}else{
			return 0
		}
    }
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath) as? MoviesCell, modelPageWithMovies != nil
            else { return UITableViewCell() }
		let oblect = modelPageWithMovies?.results![indexPath.row]
		cell.model = oblect!
        return cell
    }
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let destination = DetailsVC(nibName: "Details", bundle: nil)
		destination.model = modelPageWithMovies?.results![indexPath.row]
		navigationController?.pushViewController(destination, animated: true)
	}
}
