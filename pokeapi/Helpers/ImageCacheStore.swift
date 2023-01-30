//
//  ImageCacheStore.swift
//  pokeapi
//
//  Created by User-R05 on 1/29/23.
//

import UIKit.UIImage

final class ImageCacheStore {
    private let placheholder = #imageLiteral(resourceName: "gh.png")
    private let cache = NSCache<NSString, UIImage>()
    private let queue = DispatchQueue.global(qos: .utility)
    static let shared = ImageCacheStore()
    
    private init() {
        self.cache.countLimit = 150
        self.cache.totalCostLimit = 52428800 // 50MB
    }
    
    func cacheImage(for imageUrl: String?) async -> UIImage {
        guard let imageUrl = imageUrl, !imageUrl.isEmpty else {
            return self.placheholder
        }
        
        if let image = self.cache.object(forKey: NSString(string: imageUrl)) {
            return image
        }
        
        do {
            let image = try await ApiManager.fetchImage(imageUrl: imageUrl)
            self.cache.setObject(image, forKey: NSString(string: imageUrl))
            
            return image
        } catch {
            assertionFailure("Unable fetch image")
            return self.placheholder
        }
    }
}
