//
//  Collection.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-08.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation

class Collection {
	let id: String
	let title: String
	let description: String
	let imageURL: String
	var products: [Product]?
	
	struct Constants {
		static let idKey = "id"
		static let titleKey = "title"
		static let descriptionKey = "body_html"
		static let imageKey = "image"
		static let urlKey = "src"
	}
	
	init(dataDict: Dictionary<String, AnyObject>) {
		
		id = String((dataDict[Constants.idKey] as? Int64) ?? 0)
		title = (dataDict[Constants.titleKey] as? String) ?? ""
		description = (dataDict[Constants.descriptionKey] as? String) ?? ""
		
		guard let parsedImageDict = dataDict[Constants.imageKey] as? Dictionary<String, AnyObject>, let unwrappedImageURL = parsedImageDict[Constants.urlKey] as? String else {
			imageURL = ""
			return
		}
		
		imageURL = unwrappedImageURL
	}
}
