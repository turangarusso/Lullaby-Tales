//
//  OpenAIApp.swift
//  OpenAI
//
//  Created by Ac Analytics.
//

import SwiftUI
import Foundation
import GoogleMobileAds
import UIKit

@main
struct LullabyTalesApp: App {
//    @Environment(\.scenePhase) private var scenePhase
//       var ad = OpenAd()
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        
        
        WindowGroup {
           WelcomeView().environment(\.managedObjectContext,
                                      persistenceController.container.viewContext)

        }
//        .onChange(of: scenePhase) { phase in
//            if phase == .active {
//                ad.tryToPresentAd()
//            }
//        }
    }
}
