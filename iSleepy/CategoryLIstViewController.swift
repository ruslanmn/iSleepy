//
//  CategoryTableViewController.swift
//  iSleepy
//
//  Created by 19079884 on 16.05.2021.
//

import UIKit

class CategoryListViewController: UITableViewController {
    
    let categoryDataSource: CategoryDataSource = CategoryDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl!.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        categoryDataSource.load()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryDataSource.getCategories().count
    }

    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
       let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListCell", for: indexPath)
       
       // Configure the cell’s contents.
        cell.textLabel!.text = categoryDataSource.getCategories()[indexPath.item].name
           
       return cell
    }
}
