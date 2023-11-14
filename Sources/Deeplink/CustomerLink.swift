//
//  File.swift
//  
//
//  Created by Semih Ozsoy on 13.11.2023.
//

import Foundation

public struct CustomerLink: AppLinkable {
 
    public var customerNo: Int64!
    
    init() {
        
    }
    
    init(customerNo: Int64) {
        self.customerNo = customerNo
    }
    
    public func getLinkable(_ url: URL) -> Self? {
        let string = url.path
        guard string.hasPrefix("/customer") else {
            return nil
        }
        let customerNoString = string.replacingOccurrences(of: "/custoemr", with: "")
            .replacingOccurrences(of: "/", with: "")
        guard let customerNo = Int64(customerNoString) else {
            return nil
        }
        return Self.init(customerNo: customerNo)
    }
    
    public func link(from router: ApplinkRoutable) {
        (router as? CustomerLinkRoutable)?.customerLinkRoute(self)
    }
    
}

public protocol CustomerLinkRoutable: ApplinkRoutable {
    func customerLinkRoute(_ link: CustomerLink)
}
