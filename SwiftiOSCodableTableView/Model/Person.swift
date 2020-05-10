//
//  Person.swift
//  interviewtest
//
//  Created by Terry bu on 5/9/20.
//  Copyright © 2020 Terry Bu. All rights reserved.
//

import Foundation

struct Person: Codable {
    var name: String
    var craft: String
    
    init(name: String, craft: String) {
        self.name = name
        self.craft = craft
    }
}
