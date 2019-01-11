//
//  CollectionDetailTableViewCellDataSource.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-11.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation
import UIKit

class CollectionDetailTableViewCellDataSource {
	struct Constants {
		static let noneDescription = "None"
	}
	
	fileprivate let collection: Collection
	
	var id: String {
		return collection.id
	}
	
	var title: String {
		return collection.title
	}
	
	var description: String {
		let description = collection.description
		return description == "" ? Constants.noneDescription : description
	}
	
	var image: UIImage? {
		return ImageRepository.image(with: collection)
	}
	
	init(collection: Collection) {
		self.collection = collection
	}
}

class CollectionListTableViewCellDataSource: CollectionDetailTableViewCellDataSource {
	func presentProducts(navigator: UINavigationController) {
		if let savedProducts = self.collection.products {
			self.presentProductListTableViewController(navigator: navigator, products: savedProducts)
			return
		}
		
		ShopifyAPIRequester.requestProducts(id: self.collection.id) { [weak self] products in
			guard let this = self else { return }
			this.collection.products = products
			this.presentProductListTableViewController(navigator: navigator, products: products)
		}
	}
	
	private func presentProductListTableViewController(navigator: UINavigationController, products: [Product]) {
		let productListTableViewController = ProductListTableViewController()
		productListTableViewController.dataSource = ProductListTableViewDataSource(collection: self.collection, products:products)
		navigator.pushViewController(productListTableViewController, animated: true)
	}
}

