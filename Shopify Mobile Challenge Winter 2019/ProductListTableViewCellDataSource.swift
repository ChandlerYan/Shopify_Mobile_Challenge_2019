//
//  ProductListTableViewCellDataSource.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-10.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation
import UIKit

class ProductListTableViewCellDataSource {
	let product: Product
	
	var name: String {
		return product.name
	}
	
	var totalInventory: Int {
		return product.inventoryQuantities.reduce(0, +)
	}
	
	var image: UIImage? {
		return ImageRepository.image(with: product)
	}
	
	init(product: Product) {
		self.product = product
	}
}
