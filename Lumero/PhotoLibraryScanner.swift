import Foundation
import Photos
import SwiftUI

@MainActor
final class PhotoLibraryScanner: ObservableObject {
    @Published var status: PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
    @Published var totalAssets: Int = 0
    @Published var screenshotCount: Int = 0
    @Published var videoCount: Int = 0
    @Published var estimatedRecoverableGB: Double = 15.6
    @Published var isScanning = false

    func requestAccessAndScan() async {
        let newStatus = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
        status = newStatus
        await scanLibrary()
    }

    func scanLibrary() async {
        guard status == .authorized || status == .limited else { return }
        isScanning = true
        defer { isScanning = false }

        let all = PHAsset.fetchAssets(with: nil)
        totalAssets = all.count

        let screenshots = PHAsset.fetchAssets(with: .image, options: fetchOptions(for: .photoScreenshot))
        screenshotCount = screenshots.count

        let videos = PHAsset.fetchAssets(with: .video, options: nil)
        videoCount = videos.count

        // v0.1: placeholder estimate until file-size analysis is added in v0.2.
        estimatedRecoverableGB = max(1.2, Double(screenshotCount) * 0.003 + Double(videoCount) * 0.18)
    }

    private func fetchOptions(for subtype: PHAssetMediaSubtype) -> PHFetchOptions {
        let options = PHFetchOptions()
        options.predicate = NSPredicate(format: "(mediaSubtype & %d) != 0", subtype.rawValue)
        return options
    }
}
