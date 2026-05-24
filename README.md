# Lumero v0.1 Starter Build

This is the first practical Lumero build milestone: a native SwiftUI app shell with branding, splash screen, tab navigation, dashboard UI and a real placeholder Photos-library scan flow.

## What is included

- SwiftUI app entry point
- Splash screen using the Lumero glowing-ring identity
- Dashboard tab
- Photos tab
- Reports tab
- Tools tab
- More/settings tab
- Basic `PHPhotoLibrary` permission request
- Live asset count, screenshot count and video count once installed on a real iPhone
- Placeholder recoverable-storage estimate
- Asset catalogue with Lumero app icon files
- Info.plist permission string

## How to open in Xcode

1. Open Xcode.
2. Create a new project: **iOS > App**.
3. Product Name: `Lumero`.
4. Interface: `SwiftUI`.
5. Language: `Swift`.
6. Minimum iOS target: iOS 16 or later.
7. Delete the default `ContentView.swift` file.
8. Drag the files inside the `Lumero` folder from this pack into your Xcode project.
9. Replace the default asset catalogue with the included `Assets.xcassets`, or manually copy the `AppIcon` and `LumeroLogo` image sets.
10. Add the included `NSPhotoLibraryUsageDescription` to your project Info settings.
11. Build and run on a real iPhone. The photo library scan will not be meaningful in the simulator.

## Important v0.1 scope

v0.1 is not yet a finished cleaner or AI analysis tool. It is the working foundation. The first real target is to prove the interface, permissions, dashboard and library scanning structure.

## Recommended next versions

- v0.2: Large video finder and duplicate/similar grouping structure
- v0.3: Blur/sharpness scoring
- v0.4: Best Shot Intelligence
- v0.5: PDF-style reports and export
- v1.0: App Store-ready MVP

## Privacy positioning

Lumero should be positioned around privacy-first analysis:

> All analysis happens on your device. Your photos are never uploaded.
