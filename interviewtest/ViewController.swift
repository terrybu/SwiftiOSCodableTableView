//
//  ViewController.swift
//  interviewtest
//
//  Created by Terry Bu on 5/5/20.
//  Copyright © 2020 Terry Bu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, APIRequestManagerDelegate {
    @IBOutlet var tableView: UITableView!
    let apiRequestManager = APIRequestManager.sharedInstance
    var numberOfSpaceObjects = 0
    var peopleArray: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiRequestManager.delegate = self
    }
    
    //MARK: - Custom Delegate Methods
    func managerDidDecodeSpaceResponseFromAPI() {
        if let spaceResponse = apiRequestManager.spaceResponse {
            self.numberOfSpaceObjects = spaceResponse.number
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            return cell
    }
    
}
