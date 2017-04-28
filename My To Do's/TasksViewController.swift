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
//------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
//------------------------------------------------------------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
//------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "⭕️ -> \(task.name!) ‼️"
        } else {
            cell.textLabel?.text = "⭕️ -> \(task.name!) "
        }
        
        return cell
    }
//------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
//------------------------------------------------------------------------------------------------------------------
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
//------------------------------------------------------------------------------------------------------------------
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("OOPS! WE HAVE AN ERROR :(")
        }
    }
//------------------------------------------------------------------------------------------------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTaskSegue" { //Beginning of SelectTaskSegue Loop
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
            
        } // End of selectTaskSegue Loop
    }
//------------------------------------------------------------------------------------------------------------------
}


