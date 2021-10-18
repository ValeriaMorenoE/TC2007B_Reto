//
//  AppDelegate.swift
//  TC2007B_Reto
//
//  Created by Valeria Moreno on 24/08/21.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        Auth.auth().addStateDidChangeListener() { auth, user
            in
            if user != nil {
                let exposiciones = expoMenuViewController(nibName: "expoMenuViewController", bundle: nil)
                let boletos = TicketRestaurantController(nibName: "TicketRestaurantController", bundle: nil)
                let museo3dStoryboard = UIStoryboard(name: "Museo3d", bundle: nil)
                let museo3dvc = museo3dStoryboard.instantiateViewController(identifier: "Museo3dViewController") as! Museo3dViewController
                let noticias = noticiasViewController(nibName: "noticiasViewController", bundle: nil)
                
                let tabBarController = UITabBarController()
                tabBarController.viewControllers = [noticias, exposiciones, boletos, museo3dvc]
                
                noticias.tabBarItem = UITabBarItem(title: "Noticias", image: nil, tag: 0)
                exposiciones.tabBarItem = UITabBarItem(title: "Exposiciones", image: nil, tag: 1)
                boletos.tabBarItem = UITabBarItem(title: "Comprar Boletos", image: nil, tag: 2)
                museo3dvc.tabBarItem = UITabBarItem(title: "Museo 3D", image: nil, tag: 3)

                // Make it root or what ever you want here
                UIApplication.shared.windows.first?.rootViewController = tabBarController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
                //UIApplication.shared.windows.first?.rootViewController = vc
                //UIApplication.shared.windows.first?.makeKeyAndVisible()
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                storyboard.instantiateViewController(withIdentifier: "ViewController")
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
                UIApplication.shared.windows.first?.rootViewController = vc
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

