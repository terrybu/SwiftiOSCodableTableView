//
//  APIRequestManager.swift
//  interviewtest
//
//  Created by Terry bu on 5/9/20.
//  Copyright © 2020 Terry Bu. All rights reserved.
//

import Foundation

class APIRequestManager {
    static let sharedInstance = APIRequestManager()
    //In Swift globals, including static members of classes are lazy by default so this is correct
    let api_url = URL(string: "http://api.open-notify.org/astros.json")!
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    var spaceResponse: SpaceCraftResponse?
    var peopleArray: [Person]?
    var delegate: APIRequestManagerDelegate?
    
     init() {
        //TODO: Finish initializing and implement methods to call the JSON API
        //list of name, spacecraft
        let session = URLSession.shared
        let task = session.dataTask(with: api_url, completionHandler: { data, response, error in
            // Do something...
            if let data = data {
                print(data)
                if let spaceResponse = self.parseJsonDataIntoDecodedResponse(data: data) {
                    self.spaceResponse = spaceResponse
                    self.delegate?.managerDidDecodeSpaceResponseFromAPI()
                    if let peopleArray = spaceResponse.people {
                        self.peopleArray = peopleArray
                        self.delegate?.managerDidReceivePersonObjectsFromAPI()
                    }
                }
            }
        })
        task.resume()
     }
    
    func parseJsonDataIntoDecodedResponse(data: Data) -> SpaceCraftResponse? {
        do {
            let spaceCraftResponse = try decoder.decode(SpaceCraftResponse.self, from: data)
            return spaceCraftResponse
        } catch {
            print(error)
        }
        return nil
    }
}

protocol APIRequestManagerDelegate {
    
    func managerDidDecodeSpaceResponseFromAPI() -> Void
    func managerDidReceivePersonObjectsFromAPI() -> Void

}
