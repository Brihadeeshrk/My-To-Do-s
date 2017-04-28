//
//  TasksViewController.swift
//  My To Do's
//
//  Created by Brihadeesh Radhakrishnan on 28/04/17.
//  Copyright © 2017 Brihadeesh Radhakrishnan. All rights reserved.
//

//------------------------------------------------------------------------------------------------------------------

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//------------------------------------------------------------------------------------------------------------------
    @IBOutlet weak var tableView: UITableView!
    var tasks : [Task] = []
    var selectedIndex = 0
//------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        
        
        // Do any additional setup after loading the view, typically from a nib.
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
//------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "⭕️ -> \(task.name) ‼️"
        } else {
            cell.textLabel?.text = "⭕️ -> \(task.name) "
        }
        
        return cell
    }
//------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
//------------------------------------------------------------------------------------------------------------------
    func makeTasks() ->  [Task] {
        let task1 =  Task()
        task1.name = "Walk The Dog :)"
        task1.important = false
        
        let task2 =  Task()
        task2.name = "Buy Stuff :)"
        task2.important = true
        
        let task3 =  Task()
        task3.name = "Go Running :)"
        task3.important = true
        
        return [task1, task2, task3]
        
    }
//------------------------------------------------------------------------------------------------------------------
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
//------------------------------------------------------------------------------------------------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" { //Beginning of addSegue Loop
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        } //End of addSegue Loop
        
        if segue.identifier == "selectTaskSegue" { //Beginning of SelectTaskSegue Loop
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
            
        } // End of selectTaskSegue Loop
    }
//------------------------------------------------------------------------------------------------------------------
}


