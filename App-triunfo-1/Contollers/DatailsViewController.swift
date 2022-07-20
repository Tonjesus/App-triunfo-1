

import UIKit

class DatailsViewController: UIViewController {
    @IBOutlet var BackdropImage: UIImageView!
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        guard let movie = movie else {
            return
        }
        title = movie.title
        
        Task{
            let imageData = await Movie.downloadImageDate(withPath: movie.backdropPath)
            let image = UIImage(data: imageData) ?? UIImage()
            BackdropImage.image = image
        }
        
        TitleLabel.text = movie.title
        
        Task{
            let imageData = await Movie.downloadImageDate(withPath: movie.posterPath)
            let image = UIImage(data: imageData) ?? UIImage()
            posterImage.image = image
            
            
        }
        
       ratingLabel.text = "Rating: \(movie.voteAverage)/10"
       overviewLabel.text = movie.overview
        
    }
}
