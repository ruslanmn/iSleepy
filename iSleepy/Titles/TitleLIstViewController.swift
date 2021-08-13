//
//  CategoryTableViewController.swift
//  iSleepy
//
//  Created by 19079884 on 16.05.2021.
//

import UIKit

class TitlesListViewController: UITableViewController {
    
    let titleDataSource: TitleDataSource = TitleDataSource()
    
    public var categoryOpt: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let category = categoryOpt {
            titleDataSource.load(category: category)
        }
        refreshControl!.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        if let category = categoryOpt {
            titleDataSource.load(category: category)
        }
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleDataSource.titles.count
    }

    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleListCell", for: indexPath)
       
       // Configure the cell’s contents.
        cell.textLabel!.text = titleDataSource.titles[indexPath.item]
           
       return cell
    }
}


extension TitlesListViewController {
    static let titleImagesSegue = "TitleImagesSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.titleImagesSegue,
           let dest = segue.destination as? ImageViewController,
           let cell = sender as? UITableViewCell,
           let index = tableView.indexPath(for: cell) {
            let title = titleDataSource.titles[index.row]
            dest.titleOpt = title
        }
    }
}
