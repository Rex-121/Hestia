//
//  HestiaApp.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/9.
//

import SwiftUI

@main
struct HestiaApp: App {
    
#if os(macOS)
    /// 启动代理
    @NSApplicationDelegateAdaptor(MacAppDelegate.self) private var appDelegate;
    
#endif
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
#if os(macOS)
            EmptyView().frame(width: 0, height: 0)
#else
            MainView()
#endif
            //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
