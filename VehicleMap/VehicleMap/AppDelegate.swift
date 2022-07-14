//
//  AppDelegate.swift
//  VehicleMap
//
//  Created by Mert Koraltan on 26.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
   
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let list = UIStoryboard(name: "List", bundle: nil).instantiateInitialViewController()!
    
    window!.rootViewController = list
    window!.makeKeyAndVisible()
    
    window!.backgroundColor = .systemBackground

    return true
  }


}

