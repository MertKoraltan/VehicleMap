//
//  ListCell.swift
//  VehicleMap
//
//  Created by Mert Koraltan on 26.06.2022.
//

import Foundation
import UIKit

class ListCell: UITableViewCell {
  
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  
  func configure(type: String, status: State) {
    
    typeLabel.text = type
    statusLabel.text = status.rawValue
    
    switch status {
    case .active:
      statusLabel.textColor = .green
    case .inactive:
      statusLabel.textColor = .red
    }
  }
}
