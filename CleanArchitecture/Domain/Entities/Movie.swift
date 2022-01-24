//
//  Movie.swift
//  CleanArchitecture
//
//  Created by Alliston Aleixo on 24/01/22.
//

import Foundation

struct Movie: Equatable, Identifiable {
  typealias Identifier = String
  enum Genre {
    case adventure
    case scienceFiction
  }
  let id: Identifier
  let title: String?
  let genre: Genre?
  let posterPath: String?
  let overview: String?
  let releaseDate: Date?
}

struct MoviesPage: Equatable {
  let page: Int
  let totalPages: Int
  let movies: [Movie]
}
