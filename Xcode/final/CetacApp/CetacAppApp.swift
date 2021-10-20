//
//  CetacAppApp.swift
//  CetacApp
//
//  Created by Equipo 1 on 29/09/21.
//

import SwiftUI
//import Firebase

@main
struct CetacAppApp: App {
    
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        //let viewModel = AppViewModel()
        WindowGroup {
            //ContentView().environmentObject(ViewModel())
            //MainSplashView()
            HomeView().environmentObject(ViewModel())
            //ReportesView()
        }
    }
}

/*class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}*/
