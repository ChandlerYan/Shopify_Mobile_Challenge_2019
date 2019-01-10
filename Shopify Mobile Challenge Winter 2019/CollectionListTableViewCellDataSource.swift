//
//  CollectionListTableViewCellDataSource.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-08.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation
import UIKit

class CollectionListTableViewCellDataSource {
	let id: String
	let title: String
	let image: UIImage?
	
	init(collection: Collection) {
		id = collection.id
		title = collection.title
		image = CollectionImageRepository.image(with: collection)
	}
	
	
}
