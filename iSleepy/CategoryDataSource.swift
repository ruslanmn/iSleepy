//
//  CategoryDataSource.swift
//  iSleepy
//
//  Created by 19079884 on 16.05.2021.
//

import Foundation
import SwiftSoup

class CategoryDataSource {
    
    private var categories: [Category]
    
    init() {
        categories = []
        load()
    }
    
    func load() {
        do {
            categories = try CategoryDataSource.loadCategories()
        } catch {
            categories = []
        }
    }
    
    func getCategories() -> [Category] {
        return categories
    }
}

extension CategoryDataSource {
    struct Category {
        let name: String
        let size: Int
    }

    static func loadCategories() throws -> [Category] {
        let url = URL(string: HOST + "/category.php")!
        let html = try String(contentsOf: url)
        let doc = try SwiftSoup.parse(html, HOST)
        
        let categoryElements = try doc.select("a.mr-3")
        let sizeElements = try doc.select("span.text-muted")
        
        let categoryNames = try categoryElements.map { try $0.text() }
        let categorySizes = try sizeElements.map { try toInt($0.text()) }

        let categories = zip(categoryNames, categorySizes).map { Category(name: $0, size: $1) }
        return categories
    }

    static func toInt(_ val: String) -> Int {
        var mutableVal = String(val)
        mutableVal.removeAll(where: { $0 == "," })
        return Int(mutableVal) ?? -1
    }
}
