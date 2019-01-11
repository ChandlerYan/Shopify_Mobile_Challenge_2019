//
//  CollectionListTableViewConstroller.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-08.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import UIKit

class CollectionListTableViewConstroller: UITableViewController {
	struct Constants {
		static let title                  = "Collections List"
		static let cellHeight: CGFloat    = 100
		static let cellReusableIdentifier = "CollectionListTableViewCell"
	}
	
	var dataSource: CollectionListTableViewDataSource? {
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
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource?.collectionsCount ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReusableIdentifier, for: indexPath) as? CollectionListTableViewCell else {
			return UITableViewCell()
		}
		cell.dataSource = self.dataSource?.collectionListTableViewCellDataSource(for: indexPath)
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let cellDataSource = dataSource?.collectionListTableViewCellDataSource(for: indexPath), let navigator = self.navigationController else {
			return
		}
		
		cellDataSource.presentProducts(navigator: navigator)
	}
}

