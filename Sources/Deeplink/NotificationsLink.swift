//
//  NotificationsLink.swift
//  
//
//  Created by Semih Ozsoy on 13.11.2023.
//

import Foundation

public struct NotificationsLink {
    public func getLinkable(_ url: URL) -> Self? {
        guard url.path.hasPrefix("notifications/") else {
            return nil
        }
        return self
    }
}
