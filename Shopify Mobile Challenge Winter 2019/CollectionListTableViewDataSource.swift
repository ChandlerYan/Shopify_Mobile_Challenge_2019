//
//  CollectionListTableViewDataSource.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-08.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation

class CollectionListTableViewDataSource {
	private var collectionListTableCellDataSourceList: [CollectionListTableViewCellDataSource] = []
	
	var collectionsCount: Int {
		return collectionListTableCellDataSourceList.count
	}
	
	init(collections: [Collection]) {
		for collection in collections {
			collectionListTableCellDataSourceList.append(CollectionListTableViewCellDataSource(collection: collection))
		}
	}
	
	func collectionListTableCellDataSource(for indexPath: IndexPath) -> CollectionListTableViewCellDataSource? {
		let row = indexPath.row
		return row >= collectionsCount ? nil : collectionListTableCellDataSourceList[row]
	}
}
