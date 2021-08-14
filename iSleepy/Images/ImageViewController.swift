//
//  ImageViewController.swift
//  iSleepy
//
//  Created by 19079884 on 13.08.2021.
//

import UIKit


class ImageViewController: UITableViewController {
    
    let imageDataSource: ImageDataSource = ImageDataSource()
    
    public var titleOpt: TitleDataSource.Title?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = titleOpt {
            imageDataSource.load(titleId: title.id)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageDataSource.images.count
    }
    
    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageListCell", for: indexPath)
       
        // Configure the cell’s contents.
        let imageUrl = URL(string: imageDataSource.images[indexPath.item])!
        let imageData = try! Data(contentsOf: imageUrl)
        cell.imageView!.image = UIImage(data: imageData)
        
       return cell
    }
}
