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

    // Define your approved font list
    FontGuard.allowedFonts = [
        "SFProText-Regular",
        "SFProText-Bold",
        "SFProText-Semibold",
        "SFProText-Medium"
    ]

    // Enable font auditing during development
    FontGuard.enabled = true

    // Disable FontGuard auditing for any specific UI element in ViewController
    label.fontGuardEnabled = false

