//
//  DataLoader.swift
//  iSCWatcher
//
//  Created by 19079884 on 14.05.2021.
//

import Foundation
import SwiftSoup

let HOST = "https://sleepycomics.com"

struct Title: Identifiable {
    let id: String
}

func loadTitles() -> [Title] {
    ["Title1", "Title2", "Title3"].map { Title(id: $0) }
}

