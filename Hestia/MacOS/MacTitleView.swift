//
//  MacTitleView.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/12.
//

#if os(macOS)
import SwiftUI

struct MacTitleView: View {
    var body: some View {
        HStack(spacing: 9) {
            
            Image(systemName: "bonjour")
            
            VStack(alignment: .trailing, spacing: -2) {
                Text("输入JSON")
//                Text("2")
            }
            .font(.subheadline)
        }
    }
}

struct MacTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MacTitleView()
    }
}


#endif
