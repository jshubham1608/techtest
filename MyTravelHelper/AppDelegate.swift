//
//  AppDelegate.swift
//  MyTravelHelper
//
//  Created by Satish on 11/03/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let SCREEN_RECT = UIScreen.main.bounds

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let notice = SearchTrainRouter.createModule()
        navigateToDomainVCAndMakeRoot(notice:notice)
        return false
    }
    
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func navigateToDomainVCAndMakeRoot(notice:SearchTrainViewController) {
//        let cntr = AppDelegate.mainstoryboard.instantiateViewController(withIdentifier: "searchTrain") as! SearchTrainViewController
      let navCntr = UINavigationController(rootViewController: notice)
      navCntr.setNavigationBarHidden(true, animated: false)

      
      window = UIWindow(frame: SCREEN_RECT)
      if #available(iOS 13.0, *) {
          window?.overrideUserInterfaceStyle = .light
      } else {
          // Fallback on earlier versions
      }
      window?.makeKeyAndVisible()
      window?.rootViewController = navCntr

      window?.makeKeyAndVisible()

      //    self.pushController(cntrToPush: cntr)
      //    let navController =  self.window?.rootViewController as! UINavigationController
      //    navController.pushViewController(cntr, animated: true)

      //    navController.pushViewController(cntr, animated: false)
    }
}

