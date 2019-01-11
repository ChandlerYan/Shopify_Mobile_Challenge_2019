//
//  ProductListDataSource.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-10.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation

class ProductListTableViewDataSource {
	private let collection: Collection	
	private let productListTableViewCellDataSourceList: [ProductListTableViewCellDataSource]
	
	var collectionTitle: String {
		return collection.title
	}
	
	var productsCount: Int {
		return productListTableViewCellDataSourceList.count
	}
	
	init(collection: Collection, products: [Product]) {
		self.collection = collection
		
		var productListTableViewCellDataSourceList: [ProductListTableViewCellDataSource] = []
		for product in products {
			productListTableViewCellDataSourceList.append(ProductListTableViewCellDataSource(product: product))
		}
		self.productListTableViewCellDataSourceList = productListTableViewCellDataSourceList
	}
	
	func productListTableViewCellDataSource(for indexPath: IndexPath) -> ProductListTableViewCellDataSource? {
		let row = indexPath.row
		return row >= productsCount ? nil : productListTableViewCellDataSourceList[row]
	}
}
