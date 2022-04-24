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
            
            main
        
            JSONDisplayView()
                
        }
        .frame(minWidth: 700, idealWidth: 1200, maxWidth: 1200,
               minHeight: 400, maxHeight: .infinity)
        .listStyle(.inset)
    }
    
    var main: some View {
        NavigationViewList()
        
        #if os(iOS)
            .navigationTitle("Main")
        #else
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
            .padding(.top, 20)
            .listStyle(SidebarListStyle())
        #endif
    }
}


struct NavigationViewList: View {
    
    @State var expanded: Bool = true
    
    var body: some View {
        
        List {
                ForEach(Features.allCases) { feature in
                    NavigationLink {
                        feature
                            .mainView
#if !os(macOS)
                            .navigationBarHidden(true)
#endif
                    } label: {
                        Label(feature.rawValue, systemImage: "leaf")
                            .foregroundColor(.white)
                            .font(.title3)
                    }
                }
        }
        
    }
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}

