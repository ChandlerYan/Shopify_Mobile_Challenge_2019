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
	var title: String
	var image: UIImage?
	
	init(collection: Collection) {
		title = collection.title
		image = nil
	}
}
