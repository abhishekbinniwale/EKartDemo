//
//  NetworkingAPIManager.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 14/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation

class NetworkingAPIManager {
    
    static let sharedInstance = NetworkingAPIManager()
    
    private init(){ }
    
    let dataUrlString = "https://my-json-server.typicode.com/nancymadan/assignment/db"
    
    func fetchData(completion: @escaping (_ producs: [Product]?)->Void){
        if let url = URL(string: dataUrlString) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, respnse, error) in
                if let error = error {
                    print("error while fetching data error:\(error)")
                }
                if let data = data {
                    do {
                        let products = try JSONDecoder().decode(Products.self, from: data)
                        print(products)
                        completion(products.products)
                    } catch let error {
                        print("Error while parsing json data :\(error)")
                        completion(nil)
                    }
                }
            }
            dataTask.resume()
        }else {
            print("url is invalid")
            completion(nil)
        }
    }
}
