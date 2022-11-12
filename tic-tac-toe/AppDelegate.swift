//
//  AppDelegate.swift
//  tic-tac-toe
//
//  Created by O'ral Nabiyev on 02/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)
//        let vc = GameVC(nibName: "GameVC", bundle: nil)
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }

    


}

