//
//  MoviesRepository.swift
//  CleanArchitecture
//
//  Created by Alliston Aleixo on 24/01/22.
//

import Foundation

protocol MoviesRepository {
  /// This notation @discardableResult discards the result once the method is called, avoiding the _ notation
  @discardableResult
  func fetchMoviesList(query: MovieQuery, page: Int,
                       cached: @escaping (MoviesPage) -> Void,
                       completion: @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable?
}
