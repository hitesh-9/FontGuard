# FontGuard
FontGuard is a lightweight iOS dev-tool that automatically audits fonts across your app at runtime and highlights any UILabel, UIButton, or UITextView using a non-approved font.

What It Does
• Automatically scans every screen
• Highlights invalid fonts with a red border
• Requires zero per-screen code changes
• Helps enforce brand typography rules
• Works silently in the background

Install as you install any package as SPM

In Appdelegate

import FontGuard

func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    // Define your approved font list
    FontGuard.allowedFonts = [
        "SFProText-Regular",
        "SFProText-Bold",
        "SFProText-Semibold",
        "SFProText-Medium"
    ]

    // Enable auditing
    FontGuard.enabled = true

    return true
}
