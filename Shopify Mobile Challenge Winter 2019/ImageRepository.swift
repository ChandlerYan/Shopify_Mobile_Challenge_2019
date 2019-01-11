//
//  ImageRepository.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-09.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation
import UIKit

class ImageRepository {
	static private var collectionImageDictionary: Dictionary<String, UIImage> = Dictionary()
	static private var productImageDictionary: Dictionary<String, UIImage> = Dictionary()
	
	static func image(with collection: Collection) -> UIImage? {
		let cachedImage = collectionImageDictionary[collection.id]
		
		if cachedImage != nil {
			return cachedImage
		}
		
		guard let unwrappedUrl = URL(string: collection.imageURL), let data = try? Data(contentsOf: unwrappedUrl) else {
			return nil
		}
		
		let downloadedImage = UIImage(data: data)
		
		collectionImageDictionary[collection.id] = downloadedImage
		
		return downloadedImage
	}
	
	static func image(with product: Product) -> UIImage? {
		let cachedImage = productImageDictionary[product.id]
		
		if cachedImage != nil {
			return cachedImage
		}
		
		guard let unwrappedUrl = URL(string: product.imageURL), let data = try? Data(contentsOf: unwrappedUrl) else {
			return nil
		}
		
		let downloadedImage = UIImage(data: data)
		
		productImageDictionary[product.id] = downloadedImage
		
		return downloadedImage
	}
}
