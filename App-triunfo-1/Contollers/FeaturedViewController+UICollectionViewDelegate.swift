//
//  FeaturedViewController=UICollectionViewDelegate.swift
//  App-triunfo-1
//
//  Created by Tonjesus on 13/07/22.
//

import UIKit

extension FeatureViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var movie: Movie
        if collectionView ==  self.PopularCollectionView {
            print("Filme da popular")
            movie = popularMovies [indexPath.item]
        } else if collectionView == self.nowPlayingCollectionview {
            print("Filme da NowPlaying")
            movie = nowPlayingMovies [indexPath.item]
        } else {
            print("Filme da Upcoming")
            movie = self.upcomingMovies[indexPath.item]
        }
        
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        
        
    }
    
}

