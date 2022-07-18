//
//  PopularCollectionViewCell.swift
//  App-triunfo-1
//
//  Created by Tonjesus on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "popularCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titlelabel: UILabel!
    
    func setup(title: String, image: UIImage) {
        titlelabel.text = title
        imageView.image = image
        
    }
    
}

// cell.setup(title: popularMovies[IndexPath.item].title, image: UIImage(named: popularMovies[IndexPath.item].backdrop) ??  UIImage())

