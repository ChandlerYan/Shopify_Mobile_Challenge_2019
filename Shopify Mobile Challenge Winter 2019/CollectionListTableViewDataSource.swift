//
//  CollectionListTableViewDataSource.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-08.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation

class CollectionListTableViewDataSource {
	private let collectionListTableViewCellDataSourceList: [CollectionListTableViewCellDataSource]
	
	var collectionsCount: Int {
		return collectionListTableViewCellDataSourceList.count
	}
	
	init(collections: [Collection]) {
		var collectionListTableViewCellDataSourceList: [CollectionListTableViewCellDataSource] = []
		for collection in collections {
			collectionListTableViewCellDataSourceList.append(CollectionListTableViewCellDataSource(collection: collection))
		}
		self.collectionListTableViewCellDataSourceList = collectionListTableViewCellDataSourceList
	}
	
	func collectionListTableViewCellDataSource(for indexPath: IndexPath) -> CollectionListTableViewCellDataSource? {
		let row = indexPath.row
		return row >= collectionsCount ? nil : collectionListTableViewCellDataSourceList[row]
	}
}
