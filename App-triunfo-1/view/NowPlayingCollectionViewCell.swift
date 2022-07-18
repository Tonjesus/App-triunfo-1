//
//  NowPlayingCollectionViewCell.swift
//  App-triunfo-1
//
//  Created by Tonjesus on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titlelabel: UILabel!
    @IBOutlet var datelabel: UILabel!
    
    func setup(title:String, year:String, image:UIImage){
        titlelabel.text = title
        datelabel.text = year
        imageView.image = image
        
    }
}

////cell.setup(title: nowPlayingMovies[IndexPath.item].title,
//           year: year,
//           image: UIImage(named: nowPlayingMovies[IndexPath.item].poster) ?? UIImage)
