//
//  JSONParseView.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/20.
//

import SwiftUI

struct JSONParseView: View {
    
        @StateObject var dataSource: JSONData
    
    let sf = """
      {
        // comments
        unquoted: 'and you can quote me on that',
        singleQuotes: 'I can use "double quotes" here',
        lineBreaks: "Look, Mom! \
      No \\n's!",
        hexadecimal: 0xdecaf,
        leadingDecimalPoint: .8675309, andTrailing: 8675309.,
        positiveSign: +1,
        out: {
           outvalue: 1,
           outdic: {
              value: { value1: [{ value2: 2 }, { value3: ['3', '2', '1'], value22: 2 }] }
           },
           outarray: [
           3, '2'
        ]
        },
        trailingComma: 'in objects', andIn: ['arrays',],
        "backwardsCompatible": "with JSON",
      }
"""
    
    var body: some View {
        
        let s = sf//dataSource.JSON
        
        if (s.isEmpty) {
            EmptyView()
        }
        else {
            
            let va = JSONDisassemble.disassemble(value: s)
            ScrollView {
            JSONViewable(key: "", json: va, level: 0)
                .view()
                .padding()
                .frame(width: 600, alignment: .leading)
            }
        }
        
        
    }
}

struct JSONParseView_Previews: PreviewProvider {
    static var previews: some View {
        JSONParseView(dataSource: JSONData())
            
            
    }
}





struct JSONViewable: Identifiable {
    
    var id: String { json.debugDescription }
    
    let key: String
    
    let json: x
    
    let level: Int
}

extension JSONViewable {
    
    @ViewBuilder func view() -> some View {
        ForEach([self]) { v in
            switch v.json.type {
            case .array:
                JSONArrayView(array: v)
            case .dictionary:
                JSONDictionaryView(json: v)
            case .literal:
                JSONLiteralView(json: v)
            }
        }
    }
}




//struct P_Previews: PreviewProvider {
//    static var previews: some View {
//        JSONParseView().frame(width: 1000, height: 1000, alignment: .leading)
//    }
//}
