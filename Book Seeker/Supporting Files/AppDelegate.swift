//
//  AppDelegate.swift
//  Book Seeker
//
//  Created by Camila Matias on 03/08/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var initialViewController: UIViewController = {
           
           if let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabbarController")  as? UITabBarController {
               return controller
           }
           
           return UIViewController()
    }()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        if let window = self.window {
            window.rootViewController = self.initialViewController
            window.makeKeyAndVisible()
        }
        
        return true
    }

    

}

