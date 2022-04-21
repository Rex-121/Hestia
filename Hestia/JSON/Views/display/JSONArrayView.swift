//
//  JSONArrayView.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/21.
//

import SwiftUI


struct JSONArrayView: View {
    
    let array: JSONViewable
    
    @State var folded = false
    
    var body: some View {
        VStack(alignment: .leading) {
        
            keyDisplayView()
            
            mainView()
            
            Text("]")
        }
    }

    @ViewBuilder
    func mainView() -> some View {
        
        let value = array.json as! JSONDisassembleArray
        
        let allc = value.array
                .map { JSONViewable(key: "", json: $0, level: array.level + 1) }
        
        if (folded) {
            
            Image(systemName: "list.bullet.rectangle")
            
        } else {
            VStack(alignment: .leading) {
                ForEach(allc) { aa in
                    aa.view()
                }
            }
            .padding(.leading, 10)
        }
    }
    
    @ViewBuilder
    func keyDisplayView() -> some View {
        HStack(spacing: 3) {
            Text("\(array.key) :")
            Text("[")
            if (!folded) {
                Button {
                    folded.toggle()
                } label: {
                    Image(systemName: "rectangle.compress.vertical")
                }
            }
        }
    }
}
