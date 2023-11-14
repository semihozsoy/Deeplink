//
//  AppLinkable.swift
//  
//
//  Created by Semih Ozsoy on 13.11.2023.
//

import Foundation

/// Applinkable's for deeplink navigation.

public protocol AppLinkable {
    
    /// Returns AppLinkable  if url is satisfied
    /// - Parameter url: URL of deeplink
    
    func getLinkable(_ url: URL) -> Self?
    
    /// Returns OneLinkable if url is satisfied.
    /// -Parameter payload: Push notification payload of the deeplink.
    ///
    func getLinkable(payload: [AnyHashable: Any]) -> Self?
    
    /// Routes deeplink with `AppLinkRoutable` conformance.
    /// -Parameter router: Action to be taken when link is ready.
    func link(from router: ApplinkRoutable)
}

public extension AppLinkable {
    
    func getLinkable(payload: [AnyHashable: Any]) -> Self? {
        return nil
    }
}
