//
//  JSONDictionaryView.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/21.
//

import SwiftUI


struct JSONDictionaryView: View {
    
    let json: JSONViewable
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                if (!json.key.isEmpty) {
                    Text("\(json.key) :")
                }
                Text("{")
            }
            infomationView()
            Text("}")
        }
    }
    
    
    @ViewBuilder
    func infomationView() -> some View {
        let dic = json.json as! JSONDisassembleDic
        
        let all = dic.dictionary
            .map { JSONViewable(key: $0, json: $1, level: json.level + 1) }
        
        ForEach(all) { v in
            switch v.json.type {
            case .array:
                JSONArrayView(array: v)
            case .dictionary:
                JSONDictionaryView(json: v)
            case .literal:
                JSONLiteralView(json: v)
            }
        }.padding(.leading, 10)
    }
    
}
