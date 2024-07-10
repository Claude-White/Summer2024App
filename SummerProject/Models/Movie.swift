//
//  Movie.swift
//  SummerProject
//
//  Created by Claude White on 2024-07-09.
//

import Foundation

struct Movie: Codable {
    var title: String
    var tagline: String
    var status: String
    var runtime: Int
    var revenue: Int
    var overview: String
    var releaseDate: String
    var posterPath: String
    var backdropPath: String
    var voteAverage: Double
    var voteCount: Int
    var budget: Int
    var belongsToCollection: MovieCollection
    var homepage: String
    var genres: [Genre]
    var adult: Bool
}

struct Genre: Codable {
    var id: Int
    var name: String
}

struct MovieCollection: Codable {
    var id: Int
    var name: String
    var posterPath: String
    var backdropPath: String
}
