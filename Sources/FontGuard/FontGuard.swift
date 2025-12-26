//
//  FontGuard.swift
//  FontGurad
//
//  Created by Hitesh Takhtani
//

import UIKit
import ObjectiveC

private var kFontGuardEnabledKey: UInt8 = 0

public extension UIView {
    var fontGuardEnabled: Bool {
        get { objc_getAssociatedObject(self, &kFontGuardEnabledKey) as? Bool ?? true }
        set { objc_setAssociatedObject(self, &kFontGuardEnabledKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
}

public struct FontGuard {

    public static var enabled: Bool = false {
        didSet { if enabled { enableAutoAudit() } }
    }

    public static var allowedFonts: Set<String> = []

    static func isAllowed(_ font: UIFont) -> Bool {
        allowedFonts.contains(font.fontName)
    }

    static func violation(view: UIView, text: String?, font: String, screen: String) {
        guard view.fontGuardEnabled else { return }
        view.layer.borderColor = UIColor.systemRed.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
    }

    static func enableAutoAudit() {
        let cls = UIViewController.self
        let original = #selector(UIViewController.viewDidAppear(_:))
        let swizzled = #selector(UIViewController.fg_viewDidAppear(_:))

        guard
            let m1 = class_getInstanceMethod(cls, original),
            let m2 = class_getInstanceMethod(cls, swizzled)
        else { return }

        method_exchangeImplementations(m1, m2)
    }
}
