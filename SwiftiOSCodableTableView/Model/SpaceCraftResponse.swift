//
//  SpaceObject.swift
//  interviewtest
//
//  Created by Terry Bu on 5/5/20.
//  Copyright © 2020 Terry Bu. All rights reserved.
//

import Foundation

struct SpaceCraftResponse: Codable {
    var people: [Person]?
    var number: Int
    
    init(number: Int, people: [Person]) {
        self.number = number
        self.people = people
    }
}


