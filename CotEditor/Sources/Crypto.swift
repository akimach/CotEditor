/*
 
 Crypto.swift
 
 CotEditor
 https://coteditor.com
 
 Created by 1024jp on 2016-07-31.
 
 ------------------------------------------------------------------------------
 
 © 2016 1024jp
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 https://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 
 */

import Foundation
import CommonCrypto

extension String {
    
    /// hash value in MD5
    var md5: String {
        
        guard let data = self.data(using: .utf8) else { return "" }
        
        var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(data.bytes, CC_LONG(data.count), &hash)
        
        return hash.reduce("") { $0 + String(format: "%02x", $1) }
    }
    
}



extension Data {
    
    /// hash value in MD5
    var md5: Data {
        
        var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(self.bytes, CC_LONG(self.count), &hash)
        
        return Data(bytes: hash, count: hash.count)
    }
    
    
    fileprivate var bytes: [UInt8] {
        
        var bytes = [UInt8](repeating: 0, count: self.count)
        self.copyBytes(to: &bytes, count: self.count)
        return bytes
    }
    
}
