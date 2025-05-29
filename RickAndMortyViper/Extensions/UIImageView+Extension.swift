//
//  UIImageView+Extension.swift
//  RickAndMortyViper
//
//  Created by gagan joshi on 2025-05-28.
//

import UIKit

import UIKit
import ObjectiveC

private var imageURLKey: UInt8 = 0

extension UIImageView {
    
    /// Loads an image asynchronously with optional caching and placeholder.
    func loadImage(from url: URL, placeholder: UIImage? = nil, cache: ImageCaching = ImageCache.shared) {
        // Track URL for race condition handling
        objc_setAssociatedObject(self, &imageURLKey, url, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        self.image = placeholder

        let urlString = url.absoluteString

        // Check cache
        if let cached = cache.image(forKey: urlString) {
            self.image = cached
            return
        }

        // Download
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard
                let self = self,
                let data = data,
                let image = UIImage(data: data)
            else { return }

            // Verify the image view is still expecting this URL
            let currentURL = objc_getAssociatedObject(self, &imageURLKey) as? URL
            guard currentURL == url else { return }

            cache.setImage(image, forKey: urlString)

            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}

