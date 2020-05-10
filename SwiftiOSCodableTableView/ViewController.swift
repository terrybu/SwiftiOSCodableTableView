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
    let apiRequestManager = APIRequestManager.sharedInstance
    var numberOfSpaceObjects = 0
    var peopleArray: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiRequestManager.delegate = self
    }
}

extension ViewController: APIRequestManagerDelegate {
    //MARK: -  Delegate Methods from APIRequestManager
    func managerDidDecodeSpaceResponseFromAPI() {
        if let spaceResponse = apiRequestManager.spaceResponse {
            self.numberOfSpaceObjects = spaceResponse.number
        }
    }
    
    func managerDidReceivePersonObjectsFromAPI() {
        if let peopleArray = apiRequestManager.peopleArray {
            self.peopleArray = peopleArray
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfSpaceObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpaceCraftTableViewCell", for: indexPath) as! SpaceCraftTableViewCell
        let index = indexPath.row
        let person = self.peopleArray[index]
        cell.spaceCraftNameLabel?.text = person.craft
        cell.personNameLabel?.text = person.name
        return cell
    }
    
}
