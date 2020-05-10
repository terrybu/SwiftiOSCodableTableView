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
    var delegate: APIRequestManagerDelegate?
    
     init() {
        let session = URLSession.shared
        let task = session.dataTask(with: api_url, completionHandler: { data, response, error in
            if let data = data {
                if let spaceResponse = self.parseJsonDataIntoDecodedResponse(data: data) {
                    if let personArray = spaceResponse.people {
                        self.delegate?.requestManagerDidFinishTransformJSONtoPersonArray(personArray: personArray)
                    }
                }
            }
        })
        task.resume()
     }
    
    func parseJsonDataIntoDecodedResponse(data: Data) -> SpaceCraftResponse? {
        let decoder = JSONDecoder()
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
    
    func requestManagerDidFinishTransformJSONtoPersonArray(personArray: [Person]) -> Void

}
