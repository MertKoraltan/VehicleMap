//
//  ListController.swift
//  VehicleMap
//
//  Created by Mert Koraltan on 26.06.2022.
//

import UIKit

class ListController: UIViewController {
  
  let viewModel = ListViewModel()
  
  @IBOutlet weak var tableView: UITableView!
  
  var vehicles: [Vehicle] = [] {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    let cell = UINib(nibName: "ListCell", bundle: nil)
    tableView.register(cell, forCellReuseIdentifier: "ListCell")
    
    viewModel.fetchList { vehicles in
      self.vehicles = vehicles
    }
  }
}

//MARK: - UITableView

extension ListController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vehicles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
    let currentModel = vehicles[indexPath.row]
    cell.configure(type: currentModel.type, status: currentModel.state)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // TODO
  }
}
