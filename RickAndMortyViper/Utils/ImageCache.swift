//
//  ImageCache.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-28.
//

import UIKit

protocol ImageCaching {
    func image(forKey key: String) -> UIImage?
    func setImage(_ image: UIImage, forKey key: String)
    func clearCache()
}

final class ImageCache: ImageCaching {
    
    static let shared = ImageCache() // Singleton for global usage
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {
        // Optional cache config
        cache.countLimit = 100 // Max 100 images
        cache.totalCostLimit = 50 * 1024 * 1024 // ~50 MB
    }

    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: NSString(string: key))
    }

    func clearCache() {
        cache.removeAllObjects()
    }
}
