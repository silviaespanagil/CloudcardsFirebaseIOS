//
//  CloudcardsApp.swift
//  Cloudcards
//
//  Created by Silvia España on 25/3/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct AppMain: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView {
                
                CardListView(viewModel:CardListViewModel())
            }
        }
    }
}
