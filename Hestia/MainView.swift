//
//  MainView.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/9.
//

import SwiftUI

/// 首页
struct MainView: View {
    var body: some View {
        NavigationView {
            NavigationViewList()
                .navigationTitle("Main")
                .listStyle(SidebarListStyle())
        }
        .listStyle(.inset)
    }
}


struct NavigationViewList: View {
    
    @State var expanded: Bool = true
    
    var body: some View {
        
        return List {
            DisclosureGroup(isExpanded: $expanded) {
                ForEach(Features.allCases) { feature in
                    NavigationLink {
                        feature
                            .mainView
#if !os(macOS)
                            .navigationBarHidden(true)
#endif
                    } label: {
                        Label(feature.rawValue, systemImage: "leaf")
                    }
                }
            } label: {
                Label("Features", systemImage: "leaf")
            }
        }
        
    }
    
}

