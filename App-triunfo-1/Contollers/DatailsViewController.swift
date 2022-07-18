//
//  DatailsViewController.swift
//  App-triunfo-1
//
//  Created by Tonjesus on 13/07/22.
//

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
        
        print(movie)
        self.title = movie?.title
        
        guard let movie = movie else {
            return
        }

        self.title = movie.title
        self.BackdropImage.image = UIImage (named: movie.backdropPath)
        TitleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        
    }
}
