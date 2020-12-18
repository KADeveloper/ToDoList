//
//  AppDelegate.swift
//  ToDoList
//
//  Created by Динара Аминова on 15.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = ListVC()
        let nc = UINavigationController(rootViewController: vc)
        
        nc.navigationBar.setBackgroundImage(UIImage(named: "navBarImage"), for: .default)
        nc.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 250/255, green: 128/255, blue: 114/255, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27, weight: .bold)]
        
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        
        return true
    }
}

