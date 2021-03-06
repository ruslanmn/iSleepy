//
//  CategoryDataSource.swift
//  iSleepy
//
//  Created by 19079884 on 16.05.2021.
//

import Foundation

class TitleDataSource {
    
    public static let TITLES_PAGE: String = HOST + "/scenes/scenes-in-category.php?category="
    
    private var _titles: [Title]
    public var titles: [Title] {
        get { return _titles }
    }
    
    init() {
        _titles = []
    }
    
    func load(category: String) {
        do {
            _titles = try Self.loadTitles(category: category)
        } catch {
            _titles = []
        }
    }
}
    

extension TitleDataSource {
    struct Title: Decodable {
        let id: Int
        let name: String
        let medium: String
        let gender: String
        let additional_info: String
    }
    
    static func loadTitles(category: String) throws -> [Title] {
        let url = URL(string: "https://\(TITLES_PAGE)" + category.replacingOccurrences(of: " ", with: "%20"))!
        let jsonResponse = try String(contentsOf: url)
        
        if let data = jsonResponse.data(using: .utf8) {
            let titles: [Title] = try! JSONDecoder().decode([Title].self, from: data)
            return titles
                .filter { $0.medium == "Manga" }
        } else {
            return []
        }
    }
}
