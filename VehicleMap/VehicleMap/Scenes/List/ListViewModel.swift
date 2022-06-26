//
//  ListViewModel.swift
//  VehicleMap
//
//  Created by Mert Koraltan on 26.06.2022.
//

import Foundation

class ListViewModel {
  
  let service = ListManager()
  
  func fetchList(completion: @escaping ([Vehicle]) -> Void) {
    service.list(completion: completion)
  }
}
