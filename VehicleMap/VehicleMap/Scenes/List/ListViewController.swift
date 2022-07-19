//
//  ListController.swift
//  VehicleMap
//
//  Created by Mert Koraltan on 26.06.2022.
//

import UIKit

class ListViewController: UIViewController {
  
  let viewModel = ListViewModel()
  
  @IBOutlet weak var tableView: UITableView!
  
  private let activityIndicator = UIActivityIndicatorView(style: .medium)
  
  var vehicles: [Vehicle] = [] {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(activityIndicator)
    
    activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    tableView.delegate = self
    tableView.dataSource = self
    
    let cell = UINib(nibName: "ListCell", bundle: nil)
    tableView.register(cell, forCellReuseIdentifier: "ListCell")
    
    activityIndicator.startAnimating()
    viewModel.fetchList { vehicles in
      self.vehicles = vehicles
      DispatchQueue.main.async {
        self.activityIndicator.stopAnimating()
      }      
    }
  }
}

//MARK: - UITableView

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vehicles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
    let selectedModel = vehicles[indexPath.row]
    cell.configure(type: selectedModel.type, state: selectedModel.state)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Map", bundle: nil)
    
    guard let mapViewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController else { return }
    
    let currentModel = vehicles[indexPath.row]
    
    mapViewController.selectedCoordinate = currentModel.coordinate
    mapViewController.vehicles = vehicles
    navigationController?.pushViewController(mapViewController, animated: true)
  }
}
