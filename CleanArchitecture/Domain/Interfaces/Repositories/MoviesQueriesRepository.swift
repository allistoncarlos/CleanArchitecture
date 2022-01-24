//
//  MoviesQueriesRepository.swift
//  CleanArchitecture
//
//  Created by Alliston Aleixo on 24/01/22.
//

import Foundation
protocol MoviesQueriesRepository {
  func fetchRecentsQueries(maxCount: Int, completion: @escaping (Result<[MovieQuery], Error>) -> Void)
  func saveRecentQuery(query: MovieQuery, completion: @escaping (Result<MovieQuery, Error>) -> Void)
}
