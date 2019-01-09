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
		static let titleHeight: CGFloat   = 50
		static let cellHeight: CGFloat    = 100
		static let cellReusableIdentifier = "CollectionListTableViewCell"
	}
	
	private var dataSource: CollectionListTableViewDataSource? {
		didSet {
			self.tableView.reloadData()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		ShopifyAPIRequester.requestCollections { [weak self] collections in
			guard let this = self else { return }
			this.dataSource = CollectionListTableViewDataSource(collections: collections)
		}
		
		self.tableView.register(UINib(nibName: Constants.cellReusableIdentifier, bundle: nil), forCellReuseIdentifier: Constants.cellReusableIdentifier)
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource?.collectionsCount ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReusableIdentifier, for: indexPath) as? CollectionListTableViewCell else {
			return UITableViewCell()
		}
		cell.dataSource = self.dataSource?.collectionListTableCellDataSource(for: indexPath)
		return cell
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return Constants.title
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return Constants.titleHeight
	}
	
	override public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return Constants.cellHeight
	}
}

