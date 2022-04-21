//
//  JSONLiteralView.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/21.
//

import SwiftUI


struct JSONLiteralView: View {
    
    let json: JSONViewable
    
    var body: some View {
        HStack(spacing: 1) {
            if (!json.key.isEmpty) {
                Text("\(json.key): ")
            }
            Text(json.json.debugDescription)
        }
    }
    

}
