//
//  CompleteTaskViewController.swift
//  My To Do's
//
//  Created by Brihadeesh Radhakrishnan on 28/04/17.
//  Copyright © 2017 Brihadeesh Radhakrishnan. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var taskImportantLabel: UILabel!
    
    var task = Task()
     var previousVC = TasksViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        if task.important {
            taskLabel.text = "⭕️ -> \(task.name) ‼️"
        } else {
            taskLabel.text = "⭕️ -> \(task.name) "
        }
        
        taskImportantLabel.text = "Importance Status: \(task.important)"
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
}
