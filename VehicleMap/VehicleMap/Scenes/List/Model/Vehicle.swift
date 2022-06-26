//
//  Vehicle.swift
//  VehicleMap
//
//  Created by Mert Koraltan on 26.06.2022.
//

import Foundation

struct Vehicles: Codable {
  let list: [Vehicle]
  
  enum CodingKeys: String, CodingKey {
    case list = "poiList"
  }
}

struct Vehicle: Codable {
  
  let type: String
  let state: State
  let coordinate: Coordinate
}

struct Coordinate: Codable {
  
  let latitude: Double
  let longitude: Double
}

enum State: String, Codable {
  
  case active = "ACTIVE"
  case inactive = "INACTIVE"
}



