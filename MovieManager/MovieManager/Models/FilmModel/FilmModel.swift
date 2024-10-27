//
//  FilmModel.swift
//  MovieManager
//
//  Created by MacBook on 26.10.24.
//

import UIKit

enum Genre: String {
    case action = "Action"
    case horror = "Horror"
    case mystery = "Mystery"
    case thriller = "Thriller"
    case fantasy = "Fantasy"
    
    var description: String {
        self.rawValue
    }
}

struct FilmModel {
    let image: UIImage
    let name: String
    let description: String
    let genre: [Genre]
    var isFavorite: Bool = false
    let imdbRating: Double
    let length: String
    let language: String
    let rating: String
    let cast: [ActorModel]
}
