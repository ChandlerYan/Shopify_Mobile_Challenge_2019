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
	
	struct Constants {
		static let titleKey = "title"
		static let variantsKey = "variants"
		static let inventoryQuantityKey = "inventory_quantity"
	}
	
	init(dataDict: Dictionary<String, AnyObject>) {		
		self.name = (dataDict[Constants.titleKey] as? String) ?? ""
		
		guard let variantDicts = dataDict[Constants.variantsKey] as? [Dictionary<String, AnyObject>] else {
			self.inventoryQuantities = []
			return
		}
		
		var inventoryQuantities: [Int] = []
		
		for variantDict in variantDicts {
			guard let inventoryQuantity = variantDict[Constants.inventoryQuantityKey] as? Int else {
				continue
			}
			
			inventoryQuantities.append(inventoryQuantity)
		}
		
		self.inventoryQuantities = inventoryQuantities
	}
}
