//
//  File.swift
//  
//
//  Created by Tyrant on 2022/4/21.
//

import Foundation
import SwiftUI


struct JSONDisassemble: Decodable {
    
    
    enum ValueTypes {
        /// 字典
        case dictionary
        
        /// 数组
        case array
        
        /// 字面量
        case literal
    }
    
    
static func disassemble(value: String) -> x {
        if #available(macOS 12.0, *) {
            do {
                let data = try JSONSerialization
                    .jsonObject(with: value.data(using: .utf8)!,
                                options: [.json5Allowed])
                
                print(data)
                return JSONDisassembleDic(data: data)
            } catch {
                return JSONDisassembleLit(data: "\(error)")
            }
     
        
        } else {
            do {
                let data = try JSONSerialization
                    .jsonObject(with: value.data(using: .utf8)!,
                                options: [.fragmentsAllowed])
                return JSONDisassembleDic(data: data)
            } catch {
                return JSONDisassembleLit(data: "\(error)")
            }
     
        }
        
    }
    
    init(from decoder: Decoder) throws {
        
    }
    
}



protocol x: CustomDebugStringConvertible {
    
    var type: JSONDisassemble.ValueTypes { get }
}



struct JSONDisassembleDic: x, CustomDebugStringConvertible {
    
    let  type: JSONDisassemble.ValueTypes = .dictionary

    var debugDescription: String {
        dictionary.debugDescription
    }
    
    let dictionary: [String: x]
    
    init(data: Any) {
        
        let dic = data as? Dictionary<String, Any>
        
        var d: [String: x] = [:]
        
        dic?.forEach({ key,value in
            
            if (value is Dictionary<String, Any>) {
                d.updateValue(JSONDisassembleDic(data: value), forKey: key)
            }else if (value is [Any]) {
                d.updateValue(JSONDisassembleArray(data: value), forKey: key)
            }
            else {
                d.updateValue(JSONDisassembleLit(data: value), forKey: key)
            }
        })
        
        dictionary = d
    }
      
}

struct K: Identifiable, x {
    var type: JSONDisassemble.ValueTypes { d.type }
    
    var debugDescription: String { d.debugDescription }
    
    let d: x
    
    var id: String { d.debugDescription }
}


struct JSONDisassembleArray: x, CustomDebugStringConvertible {

    let  type: JSONDisassemble.ValueTypes = .array
    
    let array: [x]
    
    var debugDescription: String {
        return array.debugDescription
    }
    
    init(data: Any) {
        
        let dic = data as? [Any]
        
        array = dic?.map({ value -> x in
            
            if (value is Dictionary<String, Any>) {
                return JSONDisassembleDic(data: value)
            }
            
            if (value is [Any]) {
                return JSONDisassembleArray(data: value)
            }
            
            return JSONDisassembleLit(data: value)
        }) ?? []
        
    }
    
    
}


struct JSONDisassembleLit: x, CustomDebugStringConvertible {
    
    let  type: JSONDisassemble.ValueTypes = .literal
    
    let data: Any
    var debugDescription: String {
        "\(data)"
    }
}
