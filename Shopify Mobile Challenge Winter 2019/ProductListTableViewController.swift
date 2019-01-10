//
//  ProductListTableViewController.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-10.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation
import UIKit

class ProductListTableViewController: UITableViewController {
	struct Constants {
		static let title                  = "Product List"
		static let cellHeight: CGFloat    = 100
		static let cellReusableIdentifier = "CollectionListTableViewCell"
	}
	
	var dataSource: ProductListTableViewDataSource? {
		didSet {
			self.tableView.reloadData()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = Constants.title
		
		self.tableView.register(UINib(nibName: Constants.cellReusableIdentifier, bundle: nil), forCellReuseIdentifier: Constants.cellReusableIdentifier)
		
		self.tableView.rowHeight = Constants.cellHeight
	}
}
