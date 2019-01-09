//
//  ShopifyAPIRequester.swift
//  Shopify Mobile Challenge Winter 2019
//
//  Created by Yucheng Yan on 2019-01-08.
//  Copyright © 2019 Yucheng Yan. All rights reserved.
//

import Foundation
import Alamofire

class ShopifyAPIRequester {
	private struct Constants {
		static let collectionsApiURL = "https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
	}
	
	static func requestCollections(completion: (([Collection])->())?) {
		Alamofire.request(Constants.collectionsApiURL)
			.responseJSON(completionHandler: { response in
				switch response.result {
				case .success(let content):
					guard let json = content as? Dictionary<String, AnyObject>, let collectionsDict = json.first?.value as? [Dictionary<String, AnyObject>] else { return }
					let collections = ShopifyAPIRequester.parseCollectionsJSON(collectionsDict: collectionsDict)
					completion?(collections)
				case .failure(let error):
					print("Request Error: \(error)")
				}
			})
	}
	
	static private func parseCollectionsJSON(collectionsDict: [Dictionary<String, AnyObject>]) -> [Collection] {
		var collections: [Collection] = []
		for collectionDict in collectionsDict {
			collections.append(Collection(dataDict: collectionDict))
		}
		return collections
	}
}
