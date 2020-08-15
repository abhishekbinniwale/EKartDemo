//
//  CustomImageView.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 15/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    var imageUrlString : String?
    var dataTask : URLSessionDataTask?
    
    ///Load an image from cache / download it from Network
    func loadImageUsingUrl(urlSting: String){
        image = nil
        imageUrlString = urlSting
        
        if let url = URL(string: urlSting) {
            ///First check in chache if image is present
            ///Otherwise Download image and set inage and save in cache
            if let imageFromCache = imageCache.object(forKey: urlSting as NSString) {
                self.image = imageFromCache
               // print("cached image from url :\(urlSting)")
                return
            } else {
               // print("fetch image from url :\(urlSting)")
                dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print("Error while downloaing data for imageurl :\(urlSting) error :\(String(describing: error))")
                        self.image = UIImage(named: "notFound")
                        return
                    }
                    if let imageData = data {
                        DispatchQueue.main.async {
                            if let imageToCache = UIImage(data: imageData) {
                                ///Set downloaded image
                                if self.imageUrlString == urlSting {
                                    self.image = imageToCache
                                }
                                ///Cache downloaded Image data
                                imageCache.setObject(imageToCache, forKey: urlSting as NSString)
                            }
                        }
                    }
                }
                dataTask?.resume()
            }
        }
    }
    
    func clearImageCache(){
        print("Clear all chached images")
        imageCache.removeAllObjects()
    }
    ///Delete Image from Cache for urlString passed
    func deleteImageFromCacheForUrl(urlString: String){
        imageCache.removeObject(forKey: urlString as NSString)
    }
    
    func cancelImageDownload(){
        print("Cancel data task for current request url:\(String(describing: dataTask?.currentRequest?.url))")
        self.dataTask?.cancel()
    }
    
}
