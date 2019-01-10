//
//  Product.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-09.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation

class Product {
	let name: String
	let inventoryQuantities: [Int]
	let productImageURL: String
	
	struct Constants {
		static let titleKey = "title"
		static let variantsKey = "variants"
		static let inventoryQuantityKey = "inventory_quantity"
		static let imageKey = "image"
		static let urlKey = "src"
	}
	
	init(dataDict: Dictionary<String, AnyObject>) {		
		self.name = (dataDict[Constants.titleKey] as? String) ?? ""
		
		if let variantDicts = dataDict[Constants.variantsKey] as? [Dictionary<String, AnyObject>] {
			var inventoryQuantities: [Int] = []
			
			for variantDict in variantDicts {
				guard let inventoryQuantity = variantDict[Constants.inventoryQuantityKey] as? Int else {
					continue
				}
				
				inventoryQuantities.append(inventoryQuantity)
			}
			
			self.inventoryQuantities = inventoryQuantities
		} else {
			self.inventoryQuantities = []
		}
		
		if let imageDict = dataDict[Constants.imageKey] as? Dictionary<String, AnyObject>, let imageURL = imageDict[Constants.urlKey] as? String {
			self.productImageURL = imageURL
		} else {
			self.productImageURL = ""
		}
	}
}
