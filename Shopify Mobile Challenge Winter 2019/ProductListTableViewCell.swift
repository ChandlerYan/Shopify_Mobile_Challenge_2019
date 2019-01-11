//
//  ProductListTableViewCell.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-10.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {
	struct Constants {
		static let totalInventoryPrefix = "Total Inventory: "
	}

	@IBOutlet weak var productImageView: UIImageView!
	@IBOutlet weak var productNameLabel: UILabel!
	@IBOutlet weak var totalInventoryLabel: UILabel!
	
	var dataSource: ProductListTableViewCellDataSource? {
		didSet {
			setup()
		}
	}
	
	func setup() {
		guard let unwrappedDataSource = dataSource else { return }
		productNameLabel.text = unwrappedDataSource.name
		totalInventoryLabel.text = Constants.totalInventoryPrefix + String(unwrappedDataSource.totalInventory)
		productImageView.image = unwrappedDataSource.image
	}
}
