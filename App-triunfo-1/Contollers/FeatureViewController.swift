//
//  ViewController.swift
//  App-triunfo-1
//
//  Created by Tonjesus on 05/07/22.
//

import UIKit

class FeatureViewController: UIViewController {
    
    var popularMovies: [Movie] = [] //Movie.popularMovies()
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    
    
    @IBOutlet weak var PopularCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionview: UICollectionView!
    @IBOutlet weak var UpcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PopularCollectionView.dataSource = self
        PopularCollectionView.delegate = self
        
        
        nowPlayingCollectionview.dataSource = self
        nowPlayingCollectionview.delegate = self
        
        UpcomingCollectionView.dataSource = self
        UpcomingCollectionView.delegate = self
        
        
        Task {
            popularMovies = await Movie.popularMoviesAPI()
            self.PopularCollectionView.reloadData()
        }
        Task {
            nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionview.reloadData()
        }
        
        Task {
            upcomingMovies = await Movie.upcomingMoviesAPI()
            self.UpcomingCollectionView.reloadData()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            DatailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
            
            
        }
        
    }
    
}
