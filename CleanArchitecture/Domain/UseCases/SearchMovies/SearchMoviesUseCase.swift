//
//  SearchMoviesUseCase.swift
//  CleanArchitecture
//
//  Created by Alliston Aleixo on 24/01/22.
//

import Foundation

protocol SearchMoviesUseCase {
  typealias ResultValue = (Result<MoviesPage, Error>)
  
  func execute(requestValue: SearchMoviesUseCaseRequestValue,
               cached: @escaping (MoviesPage) -> Void,
               completion: @escaping (ResultValue) -> Void) -> Cancellable?
}

final class DefaultSearchMoviesUseCase: SearchMoviesUseCase {
  
  private let moviesRepository: MoviesRepository
  private let moviesQueriesRepository: MoviesQueriesRepository
  
  init(moviesRepository: MoviesRepository,
       moviesQueriesRepository: MoviesQueriesRepository) {
    
    self.moviesRepository = moviesRepository
    self.moviesQueriesRepository = moviesQueriesRepository
  }
  
  func execute(requestValue: SearchMoviesUseCaseRequestValue,
               cached: @escaping (MoviesPage) -> Void,
               completion: @escaping (ResultValue) -> Void) -> Cancellable? {
    
    return moviesRepository.fetchMoviesList(query: requestValue.query,
                                            page: requestValue.page,
                                            cached: cached,
                                            completion: { result in
      
      if case .success = result {
        self.moviesQueriesRepository.saveRecentQuery(query: requestValue.query) { _ in }
      }
      
      completion(result)
    })
  }
}

struct SearchMoviesUseCaseRequestValue {
  let query: MovieQuery
  let page: Int
}
