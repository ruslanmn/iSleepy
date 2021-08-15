import Foundation
import SwiftSoup

import UIKit

class ImageDataSource {
    
    private var _images: [String]
    public var images: [String] {
        get { return _images }
    }
    
    init() {
        _images = []
    }
    
    func load(titleId: Int) {
        do {
            _images = try Self.loadImages(titleId: titleId)
        } catch {
            _images = []
        }
    }
}

extension ImageDataSource {
    static func loadImages(titleId: Int) throws -> [String] {
        let titlePage = "https://\(HOST)/\(titleId)"
        let url = URL(string: titlePage)!
        let html = try String(contentsOf: url)
        let doc = try SwiftSoup.parse(html)
        
        let imgElements = try doc.select("img[data-jslghtbx-group$=scene]")
        
        return try imgElements.map { try $0.attr("data-jslghtbx") }
    }

}
