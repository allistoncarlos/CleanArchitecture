//
//  UseCase.swift
//  CleanArchitecture
//
//  Created by Alliston Aleixo on 24/01/22.
//

import Foundation

public protocol UseCase {
  @discardableResult
  func start() -> Cancellable?
}
