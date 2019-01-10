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
		static let suffixURL = "page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
		static let collectionsApiURL = "https://shopicruit.myshopify.com/admin/custom_collections.json?" + Constants.suffixURL
		static let productsApiURL = "https://shopicruit.myshopify.com/admin/collects.json?collection_id="
		static let idKey = "id"
	}
	
	static func requestCollections(completion: (([Collection])->())?) {
		Alamofire.request(Constants.collectionsApiURL)
			.responseJSON(completionHandler: { response in
				switch response.result {
				case .success(let content):
					guard let json = content as? Dictionary<String, AnyObject>, let collectionDicts = json.first?.value as? [Dictionary<String, AnyObject>] else { return }
					let collections = ShopifyAPIRequester.parseCollectionsJSON(collectionDicts: collectionDicts)
					completion?(collections)
				case .failure(let error):
					print("Collection List Request Error: \(error)")
				}
			})
	}
	
	static private func parseCollectionsJSON(collectionDicts: [Dictionary<String, AnyObject>]) -> [Collection] {
		var collections: [Collection] = []
		for collectionDict in collectionDicts {
			collections.append(Collection(dataDict: collectionDict))
		}
		return collections
	}
	
	static func requestProducts(id: String, completion: (([Product])->())?) {
		Alamofire.request(Constants.productsApiURL + id + "&" + Constants.suffixURL)
			.responseJSON(completionHandler: { response in
				switch response.result {
				case .success(let content):
					guard let json = content as? Dictionary<String, AnyObject>, let productDicts = json.first?.value as? [Dictionary<String, AnyObject>] else { return }
					
					var productsApiURL = Constants.productsApiURL
					
					for product in productDicts {
						guard let id = product[Constants.idKey] as? String else {
							continue
						}
						
						productsApiURL = productsApiURL + id + ","
					}
					
					productsApiURL = productsApiURL + "&" + Constants.suffixURL
					
					requestProductsDetails(url: productsApiURL, completion: completion)
					
				case .failure(let error):
					print("Product List Request Error: \(error)")
				}
			})
	}
	
	static private func requestProductsDetails(url: String, completion: (([Product])->())?) {
		Alamofire.request(url)
			.responseJSON(completionHandler: { response in
				switch response.result {
				case .success(let content):
					guard let json = content as? Dictionary<String, AnyObject>, let productDetailDicts = json.first?.value as? [Dictionary<String, AnyObject>] else { return }
					let products = ShopifyAPIRequester.parseProductDetailsJSON(productDetailDicts: productDetailDicts)
					completion?(products)
				case .failure(let error):
					print("Product Detail Request Error: \(error)")
				}
			})
	}
	
	static private func parseProductDetailsJSON(productDetailDicts: [Dictionary<String, AnyObject>]) -> [Product] {
		var products: [Product] = []
		for productDetailDict in productDetailDicts {
			products.append(Product(dataDict: productDetailDict))
		}
		return products
	}
}
