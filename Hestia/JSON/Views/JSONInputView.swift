//
//  JSONInputView.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/9.
//


import SwiftUI

class JSONData: ObservableObject {
    @Published var JSON = "";
}
struct JSONDisplayView: View {
    
    let jsonData = JSONData()
    
    @StateObject var s = JSONData()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            JSONInputView(dataSource: s)
            JSONParseView(dataSource: s)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        
    }
    
}


struct JSONInputView: View {
    
    @StateObject var dataSource: JSONData
    
    
    
    @State public var text: String = """
    {
      // comments
      unquoted: 'and you can quote me on that',
      singleQuotes: 'I can use "double quotes" here',
      lineBreaks: "Look, Mom! \
    No \\n's!",
      hexadecimal: 0xdecaf,
      leadingDecimalPoint: .8675309, andTrailing: 8675309.,
      positiveSign: +1,
      trailingComma: 'in objects', andIn: ['arrays',],
      "backwardsCompatible": "with JSON",
    }
    """

    var body: some View {
                
        return VStack {
            
            TextEditor(text: $text)
                .font(.title3)
                .lineSpacing(10)
                .disableAutocorrection(true)
                .lineLimit(5)
                .background(Color.gray.opacity(0.3))
                .multilineTextAlignment(.leading)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                .padding(20) // 不加padding，文字会漏出来 原因未知
            
            
            HStack(alignment: .bottom) {
                Button {
                    dataSource.JSON = text
                    
                } label: {
                    Label("解析", systemImage: "signature")
                }
                .frame(alignment: .leading)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
        
    }
    
}
