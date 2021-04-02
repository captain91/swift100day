//
//  Person.swift
//  Project-day50
//
//  Created by Shibo Sun on 2021/4/2.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String){
        self.name = name
        self.image = image
    }
}
