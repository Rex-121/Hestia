//
//  JSONInputView_Mac.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/12.
//


import SwiftUI


struct JSONInputView_Mac: View {
    
    @State var s = ""
    
    var body: some View {
        
        VStack {
            
            Text("Hello World!")
            
            TextEditor(text: $s)
            
            Divider()
            
            ScrollView {
                Text(s)
            }
            
            
            Button("Quit") {
                NSApp.terminate(self)
            }
            
            
        }
        
    }
    
    
}

