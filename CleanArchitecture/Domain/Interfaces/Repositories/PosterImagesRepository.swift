//
//  PosterImagesRepository.swift
//  CleanArchitecture
//
//  Created by Alliston Aleixo on 24/01/22.
//

import Foundation

protocol PosterImagesRepository {
  func fetchImage(with imagePath: String, width: Int, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable?
}
