//
//  SpaceObject.swift
//  interviewtest
//
//  Created by Terry Bu on 5/5/20.
//  Copyright © 2020 Terry Bu. All rights reserved.
//

import Foundation

class SpaceObject {
    var people: [Person]?
    var number: Int
    
    init(number: Int, people: [Person]) {
        self.number = number
        self.people = people
    }
}

class Person {
    var name: String
    var craft: String
    
    init(name: String, craft: String) {
        self.name = name
        self.craft = craft
    }
}
