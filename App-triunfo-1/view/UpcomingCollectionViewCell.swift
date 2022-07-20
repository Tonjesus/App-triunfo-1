//
//  UpcomingCollectionViewCell.swift
//  App-triunfo-1
//
//  Created by Tonjesus on 19/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
       
       @IBOutlet var titleLabel: UILabel!
       @IBOutlet var dateLabel: UILabel!
       @IBOutlet var imageView: UIImageView!
       
    
    func setup(title:String, year: String, image:UIImage){
        titleLabel.text = title
        dateLabel.text = year
        imageView.image = image
    }
}
