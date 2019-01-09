//
//  CollectionListTableViewCell.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-08.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import UIKit

class CollectionListTableViewCell: UITableViewCell {

	@IBOutlet weak var thumbnailView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	
	var dataSource: CollectionListTableViewCellDataSource? {
		didSet {
			setup()
		}
	}
	
	func setup() {
		titleLabel.text = dataSource?.title
	}
}
