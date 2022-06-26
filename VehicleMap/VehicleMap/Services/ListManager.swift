//
//  ListManager.swift
//  VehicleMap
//
//  Created by Mert Koraltan on 26.06.2022.
//

import Foundation

class ListManager {
  
  func list(completion: @escaping ([Vehicle]) -> Void) {
    
    let urlString = "https://poi-api.mytaxi.com/PoiService/poi/v1?p2Lat=53.394655&p1Lon=9.757589&p1Lat=53.694865&p2Lon=10.099891#"
    
    if let url = URL(string: urlString) {
      let session = URLSession(configuration: .default)
      let task = session.dataTask(with: url) { data, response, error in
        if error != nil {
          return
        }
        else if let safeData = data,
                  let vehicles = self.parseJSON(safeData)
        {
          completion(vehicles)
        }
      }
      task.resume()
    }
  }
  
  func parseJSON(_ data: Data) -> [Vehicle]? {
    
    do {
      let decoder = JSONDecoder()
      let result = try decoder.decode(Vehicles.self, from: data)
      return result.list
    } catch {
      return nil
    }
  }
}
