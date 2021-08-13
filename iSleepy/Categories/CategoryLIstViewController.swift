//
//  CategoryTableViewController.swift
//  iSleepy
//
//  Created by 19079884 on 16.05.2021.
//

import UIKit

class CategoryListViewController: UITableViewController {
    
    let categoryDataSource: CategoryDataSource = CategoryDataSource()
    
    static let titleSegueIdentifier = "TitleDetailSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.titleSegueIdentifier,
           let dest = segue.destination as? TitlesListViewController,
           let cell = sender as? UITableViewCell,
           let index = tableView.indexPath(for: cell) {
            let category = categoryDataSource.categories[index.row]
            dest.categoryOpt = category.name
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        categoryDataSource.load()
        refreshControl!.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        categoryDataSource.load()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryDataSource.categories.count
    }

    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListCell", for: indexPath)
       
       // Configure the cell’s contents.
        cell.textLabel!.text = categoryDataSource.categories[indexPath.item].name
           
       return cell
    }
}
