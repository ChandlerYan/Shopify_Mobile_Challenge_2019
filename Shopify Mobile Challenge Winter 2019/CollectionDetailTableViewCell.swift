//
//  CollectionDetailTableViewCell.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-11.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import UIKit

class CollectionDetailTableViewCell: UITableViewCell {
	
	struct Constants {
		static let descriptionPrefix = "Collection Description: "
	}
	
	@IBOutlet weak var collectionImageView: UIImageView!
	@IBOutlet weak var collectionDescriptionLabel: UILabel!
	
	var dataSource: CollectionDetailTableViewCellDataSource? {
		didSet {
			setup()
		}
	}
	
	func setup() {
		guard let unwrappedDataSource = dataSource else {
			return
		}
		
		collectionImageView.image = unwrappedDataSource.image
		collectionDescriptionLabel.text = Constants.descriptionPrefix + unwrappedDataSource.description
	}
}
