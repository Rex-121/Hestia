//
//  Features.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/9.
//

import Foundation

/// 支持的功能
enum Features: String {
    
    /// `JSON`
    ///  在部分情况下支持`JSON` 5
    case JSON
    
    /// Markdown
    case markdown
    
}

extension Features: CaseIterable {

    var id: RawValue { rawValue }
    
}

extension Features: Identifiable { }

