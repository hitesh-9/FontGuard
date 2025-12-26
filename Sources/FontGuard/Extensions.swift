//
//  Extensions.swift
//  FontGurad
//
//  Created by Hitesh Takhtani
//

import UIKit

// MARK: - Auditors
extension UILabel {
    func auditFont(screen: String) {
        guard FontGuard.enabled, fontGuardEnabled else { return }
        if !FontGuard.isAllowed(font) {
            FontGuard.violation(view: self, text: text, font: font.fontName, screen: screen)
        }
    }
}

extension UIButton {
    func auditFont(screen: String) {
        guard FontGuard.enabled, fontGuardEnabled, let lbl = titleLabel else { return }
        if !FontGuard.isAllowed(lbl.font) {
            FontGuard.violation(view: lbl, text: lbl.text, font: lbl.font.fontName, screen: screen)
        }
    }
}

extension UITextView {
    func auditFont(screen: String) {
        guard FontGuard.enabled, fontGuardEnabled else { return }
        guard let f = font else {
            FontGuard.violation(view: self, text: text, font: "nil", screen: screen)
            return
        }
        if !FontGuard.isAllowed(f) {
            FontGuard.violation(view: self, text: text, font: f.fontName, screen: screen)
        }
    }
}

// MARK: - Recursive Scan
extension UIView {
    func auditAllFonts(screen: String) {
        guard FontGuard.enabled, fontGuardEnabled else { return }
        for v in subviews {
            if let l = v as? UILabel { l.auditFont(screen: screen) }
            if let b = v as? UIButton { b.auditFont(screen: screen) }
            if let t = v as? UITextView { t.auditFont(screen: screen) }
            v.auditAllFonts(screen: screen)
        }
    }
}

// MARK: - Auto Injection
extension UIViewController {
    @objc func fg_viewDidAppear(_ animated: Bool) {
        fg_viewDidAppear(animated)
        guard FontGuard.enabled else { return }
        let screen = String(describing: type(of: self))
        view.auditAllFonts(screen: screen)
    }
}
