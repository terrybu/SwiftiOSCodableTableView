//
//  ViewController.swift
//  interviewtest
//
//  Created by Terry Bu on 5/5/20.
//  Copyright © 2020 Terry Bu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var spaceObject: SpaceObject?
    //TODO: - Refactor out to manager objects that can handle network call
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //http://open-notify.org/Open-Notify-API/People-In-Space/
        //list of name, spacecraft
        let session = URLSession.shared
        let url = URL(string: "http://api.open-notify.org/astros.json")!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            // Do something...
            if let data = data {
               
            }
        })
        task.resume()
        
        //TODO: Use Codable for parsing json apple's own library
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            return cell
    }
    
}
