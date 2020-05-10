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
    var peopleArray: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiRequestManager.delegate = self
    }
}

extension ViewController: APIRequestManagerDelegate {
    //MARK: -  Delegate Methods from APIRequestManager
    
    func requestManagerDidFinishTransformJSONtoPersonArray(personArray: [Person]) {
        self.peopleArray = personArray
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.peopleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpaceCraftTableViewCell", for: indexPath)
        let index = indexPath.row
        let person = self.peopleArray[index]
        cell.textLabel?.text = person.craft
        cell.detailTextLabel?.text = person.name
        return cell
    }
    
}
