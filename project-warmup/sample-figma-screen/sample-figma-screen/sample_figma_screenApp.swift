//
//  sample_figma_screenApp.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct sample_figma_screenApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        HomeView()
      }
    }
  }
}
/*
import Firebase
@main
struct sample_figma_screenApp: App {
    init() {
           FirebaseApp.configure()
       }
       var body: some Scene {
           WindowGroup {
               ContentView()
           }
       }
   }
*/
