//
//  ListCell.swift
//  VehicleMap
//
//  Created by Mert Koraltan on 26.06.2022.
//

import UIKit

class ListCell: UITableViewCell {
  
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  
  func configure(type: String, state: State) {
    
    typeLabel.text = type
    statusLabel.text = state.rawValue
    
    switch state {
    case .active:
      statusLabel.textColor = .green
    case .inactive:
      statusLabel.textColor = .red
    }
  }
}
