//
//  asdfasdf.swift
//  MoCocktail
//
//  Created by Admin on 30/11/22.
//


import UIKit

let appDel : SceneDelegate = UIApplication.shared.delegate as! SceneDelegate

func getAppDelegate() -> SceneDelegate {
    return appDel
}

func getWindow() -> UIWindow {
    return appDel.window!
}

func getRootNavigation() -> UINavigationController? {
    
    let windows = getWindow()
    if let navCtr = windows.rootViewController as? UINavigationController {
        return navCtr
    }
    return nil
}


