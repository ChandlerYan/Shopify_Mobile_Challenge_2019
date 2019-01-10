//
//  ProductListDataSource.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-10.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation

class ProductListTableViewDataSource {
	let collection: Collection
	let products: [Product]
	
	init(collection: Collection, products: [Product]) {
		self.collection = collection
		self.products = products
	}
}
