//
//  Book.swift
//  Books
//
//  Created by SDS-015 on 2017. 4. 28..
//  Copyright © 2017년 SDS-015. All rights reserved.
//

import Foundation
import UIKit

class Book: NSObject, NSCoding
{
    enum Key: String
    {
        case title = "title"
        case author = "author"
        case coverImage = "coverImage"
        case URL = "url"
    }
    
    let title: String
    let author: String?
    let coverImage: UIImage?
    let URL: String?
    
    init(title: String, author: String?, coverImage: UIImage?, URL: String?)
    {
        self.title = title
        self.author = author
        self.coverImage = coverImage
        self.URL = URL
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(self.title, forKey: Key.title.rawValue)
        aCoder.encode(self.author, forKey: Key.author.rawValue)
        aCoder.encode(self.coverImage, forKey: Key.coverImage.rawValue)
        aCoder.encode(self.URL, forKey: Key.URL.rawValue)
        print("\(self.title) was encoded")
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        self.title = aDecoder.decodeObject(forKey: Key.title.rawValue) as! String
        self.author = aDecoder.decodeObject(forKey: Key.author.rawValue) as? String
        self.coverImage = aDecoder.decodeObject(forKey: Key.coverImage.rawValue) as? UIImage
        self.URL = aDecoder.decodeObject(forKey: Key.URL.rawValue) as? String
        print("\(self.title) was decoded")
    }
}
