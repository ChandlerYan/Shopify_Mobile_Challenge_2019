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
		static let cellHeight: CGFloat    = 100
		static let cellReusableIdentifier = "ProductListTableViewCell"
		static let collectionDetailCellReusableIdentifier = "CollectionDetailTableViewCell"
	}
	
	var dataSource: ProductListTableViewDataSource? {
		didSet {
			self.tableView.reloadData()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = dataSource?.collectionTitle
		
		self.tableView.register(UINib(nibName: Constants.cellReusableIdentifier, bundle: nil), forCellReuseIdentifier: Constants.cellReusableIdentifier)
		self.tableView.register(UINib(nibName: Constants.collectionDetailCellReusableIdentifier, bundle: nil), forCellReuseIdentifier: Constants.collectionDetailCellReusableIdentifier)
		
		self.tableView.estimatedRowHeight = Constants.cellHeight
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource?.productsCount ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.collectionDetailCellReusableIdentifier, for: indexPath) as? CollectionDetailTableViewCell else {
				return UITableViewCell()
			}
			cell.dataSource = self.dataSource?.collectionDetailTableViewCellDataSource()
			return cell
		}
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReusableIdentifier, for: indexPath) as? ProductListTableViewCell else {
			return UITableViewCell()
		}
		cell.dataSource = self.dataSource?.productListTableViewCellDataSource(for: indexPath)
		return cell
	}
}
