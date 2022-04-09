//
//  Features-Extension.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/9.
//

import SwiftUI



extension Features {
    
    /// 所代表的主页面
    var mainView: some View {
        get {
            switch self {
            case .JSON:
                return JSONDisplayView()
            case .markdown:
                return JSONDisplayView()
            }
        }
    }
    
}
