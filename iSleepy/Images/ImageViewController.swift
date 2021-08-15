//
//  ImageViewController.swift
//  iSleepy
//
//  Created by 19079884 on 16.08.2021.
//

import Foundation
import UIKit

class ImageViewController: UIViewController {
    
    public var index: Int!
    
    public func createImageView(imageUrl: String, index: Int) {
        self.index = index
        let imageView = UIImageView()
        view = imageView
        let task = URLSession.shared.dataTask(with: URL(string: imageUrl)!) { data, response, error in
            DispatchQueue.main.async {
                if let imgData = data {
                    imageView.image = UIImage(data: imgData)
                }
            }
        }
        task.resume()
    }
}
