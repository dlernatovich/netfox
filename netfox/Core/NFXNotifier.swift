//
//  NFXNotifier.swift
//  netfox_ios
//
//  Created by Dmitry Lernatovich on 28.11.2019.
//  Copyright © 2019 kasketis. All rights reserved.
//

import Foundation

/// Notificaton
private let K_NOTIFICATION = "B2xeAp2IjPYzWYcxEfbQbvQCTSK9JfVa5gewv64D";
/// Key for the message in user info
private let K_KEY = "CoLTyNvgwRPx5UaoRANc6esjHFFRSOrk301pEntY";

/// Class which provide the get notification
public final class NFXNotifier {
    
    /// Instance of the {@link NotificationCenter}
    private static var center: NotificationCenter {return NotificationCenter.default};
    
    /// Instance of the {@link Notification.Name}
    private static var name: Notification.Name {return Notification.Name.init(rawValue: K_NOTIFICATION)}
    
    /// Method which provide the subscribe for the notifcation
    /// - Parameters:
    ///   - owner: instance of the owner
    ///   - selector: selector for the subscription
    public static func subscribe(owner: AnyObject?, selector: Selector?) {
        guard let owner = owner, let selector = selector else {return};
        center.addObserver(owner, selector: selector, name: name, object: nil);
    }
    
    /// Method which provide the post notification
    /// - Parameter message: message value
    internal static func post(message: String?) {
        guard let message = message else {return};
        let info: [String: String] = [K_KEY: message];
        center.post(name: name, object: nil, userInfo: info);
    }
    
    /// Method which provide the getting message from the notification
    /// - Parameter notification: instance of the {@link Notification}
    public func getMessage(notification: Notification?) -> String? {
        guard let notification = notification else {return nil};
        return notification.userInfo?[K_KEY] as? String;
    }
    
}

/*
 HOW TO USE
 1. Subscribe for the notification
    public static func subscribe(owner: AnyObject?, selector: Selector?)
 2. Method should be like
    func showSpinningWheel(notification: NSNotification)
 3. For getting message use the method of:
    public func getMessage(notification: Notification?) -> String?
 */
