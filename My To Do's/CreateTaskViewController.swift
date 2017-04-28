//
//  CreateTaskViewController.swift
//  My To Do's
//
//  Created by Brihadeesh Radhakrishnan on 28/04/17.
//  Copyright © 2017 Brihadeesh Radhakrishnan. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        
        //Create Task from Info Provided
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //Save pop - back
        
        navigationController!.popViewController(animated: true)
    }
}
