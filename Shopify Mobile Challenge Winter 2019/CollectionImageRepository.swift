//
//  CollectionImageRepository.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-09.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation
import UIKit

class CollectionImageRepository {
	static private var imageDictionary: Dictionary<Int64, UIImage> = Dictionary()
	
	static func image(with collection: Collection) -> UIImage? {
		let cachedImage = imageDictionary[collection.id]
		
		if cachedImage != nil {
			return cachedImage
		}
		
		guard let unwrappedUrl = URL(string: collection.imageURL), let data = try? Data(contentsOf: unwrappedUrl) else {
			return nil
		}
		
		let downloadedImage = UIImage(data: data)
		
		imageDictionary[collection.id] = downloadedImage
		
		return downloadedImage
	}
}
