//
//  Movie.swift
//  App-triunfo-1
//
//  Created by Tonjesus on 13/07/22.
//

import Foundation
struct Movie: Codable {
    let title: String
    let posterPath: String
    let backdropPath: String
    let voteAverage: Float
    let releaseDate : String
    let overview: String
    let genres: [String]?
    
    
}
