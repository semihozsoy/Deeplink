//
//  File.swift
//  
//
//  Created by Semih Ozsoy on 13.11.2023.
//

import Foundation

/// Manager for deeplinks.

public final class DeeplinkManager {
    /// Application supported deeplinks.
    private var links: [AppLinkable]
    
    /// Initializes manager with supported links.
    public init(supportedLinks links: [AppLinkable]) {
        self.links = links
    }
    
    /// Returns linkable satisfied with the url.
    /// - Parameter url: URL of the deeplink.
    /// - Returns: Linkable satisfied with the url.
    public func getLinkable(_ url: URL) -> AppLinkable? {
        
        for(index, link) in links.enumerated() {
            guard let activeLink = link.getLinkable(url) else {
                continue
            }
            links[index] = activeLink
            return activeLink
        }
        return nil
    }
}

extension DeeplinkManager {
    
    /// Returns linkable satisfied with the payload.
    /// - Parameter payload: Push notification payload of the deeplink.
    /// - Returns: linkable satisfied with the payload
    
    public func getLinkable(payload: [AnyHashable: Any]) -> AppLinkable? {
        for (index, link) in links.enumerated() {
            guard let activeLink = link.getLinkable(payload: payload) else {
                continue
            }
            links[index] = activeLink
            return activeLink
        }
        return nil
    }
}
