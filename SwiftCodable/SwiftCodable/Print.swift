//
//  Print.swift
//  SwiftCodable
//
//  Created by kuroky on 2018/7/27.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

class LogPrint {
    class func decodeStart() {
        print("==========  decode start  =========== \n")
    }
    
    class func decodeEnd() {
        print("==========  decode end   ============ \n")
    }
    
    class func encodeStart() {
        print("==========  encode start  =========== \n")
    }
    
    class func encodeEnd() {
        print("==========  decode end  ===========")
    }
    
    class func errorDesc(isDecode: Bool) {
        if isDecode {
            print("decode fail")
        }
        else {
            print("encode fail")
        }
    }
    
    class func modelDesc (model: Any) {
        print("model:\(model)")
    }
}
