//
//  HCaptchaURLOpener.swift
//  HCaptcha
//
//  Copyright © 2022 HCaptcha. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

/**
 * The protocol for a contractor which can handle/open URLs in an external viewer/browser
 */
internal protocol HCaptchaURLOpener {
    /**
     Return true if url can be handled
     - parameter url: The URL to be checked
     */
    func canOpenURL(_ url: URL) -> Bool

    /**
     Handle passed url
     - parameter url: The URL to be checked
     */
    func openURL(_ url: URL)
}

/**
 * UIApplication based implementation
 */
internal class HCapchaAppURLOpener: HCaptchaURLOpener {
    func canOpenURL(_ url: URL) -> Bool {
//        #if os(iOS)
//        return UIApplication.shared.canOpenURL(url)
//        #endif
        true
    }

    func openURL(_ url: URL) {
#if os(iOS)
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
#endif
    }
}
