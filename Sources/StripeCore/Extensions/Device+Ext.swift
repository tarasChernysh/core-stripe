//
//  File.swift
//  StripeCore
//
//  Created by Taras Chernysh on 15.01.2025.
//


#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

class DeviceInfo {
    static func deviceSystemVersion() -> String {
        #if os(iOS)
        return UIDevice.current.systemVersion
        #elseif os(macOS)
        return "Unknown Mac"
        #else
        return "Unsupported Platform"
        #endif
    }
    
    static func identifierForVendor() -> String? {
            #if os(iOS)
            // Use identifierForVendor on iOS
            return UIDevice.current.identifierForVendor?.uuidString
            #elseif os(macOS)
            // Generate or retrieve the identifier on macOS
            let identifierKey = "com.clariti.uniqueDeviceIdentifier"

            if let savedIdentifier = UserDefaults.standard.string(forKey: identifierKey) {
                return savedIdentifier
            } else {
                let newIdentifier = UUID().uuidString
                UserDefaults.standard.set(newIdentifier, forKey: identifierKey)
                return newIdentifier
            }
            #else
            return "Unsupported Platform"
            #endif
        }
    
    static func localizedModel() -> String {
        #if os(iOS)
        return UIDevice.current.localizedModel
        #elseif os(macOS)
        return "Unknown Mac"
        #else
        return "Unsupported Platform"
        #endif
    }
}
