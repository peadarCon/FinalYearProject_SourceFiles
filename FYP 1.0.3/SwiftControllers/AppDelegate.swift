//
//  AppDelegate.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 15/02/2021.
//

import UIKit
import Amplify
import AmplifyPlugins

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
//    func configureAmplify() {
//       let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
//       do {
//           try Amplify.add(plugin: dataStorePlugin)
//           try Amplify.configure()
//           print("Initialized Amplify");
//       } catch {
//           // simplified error handling for the tutorial
//           print("Could not initialize Amplify: \(error)")
//       }
//    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     //   configureAmplify()
        
        do {
                try Amplify.add(plugin: AWSCognitoAuthPlugin())
                try Amplify.configure()
                print("Amplify configured with auth plugin")
            } catch {
                print("Failed to initialize Amplify with \(error)")
            }
        
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .red
        UINavigationBar.appearance().isTranslucent = true
        


      //  Amplify.Logging.logLevel = .info

        let locationManager = LocationManager.shared
        locationManager.requestWhenInUseAuthorization()
        
        
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
    
    func applicationDidEnterBackground(_ application: UIApplication) {
      CoreDataStack.saveContext()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
      CoreDataStack.saveContext()
    }
    

}
