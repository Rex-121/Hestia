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
        .frame(minWidth: 400, idealWidth: 400, maxWidth: .infinity,
               minHeight: 300, maxHeight: .infinity, alignment: .topLeading)
        
    }
    
}

struct JSONDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        JSONDisplayView()
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
    
    var textEditor: some View {
        TextEditor(text: $text)
            .font(.title3)
            .lineSpacing(10)
            .disableAutocorrection(true)
            .lineLimit(5)
            .multilineTextAlignment(.leading)
            .padding(5) // 不加padding，文字会漏出来 原因未知
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ZStack(alignment: .bottomTrailing) {
                textEditor
                Button {
                    dataSource.JSON = text
                } label: {
                    Label("解析", systemImage: "signature")
                }
                .padding(.trailing, 15)
            }
            .frame(minWidth: 0, maxWidth: .infinity,
                           minHeight: 0, idealHeight: 300, maxHeight: 400)
            
            Divider()
        }
        
    }
    
}
