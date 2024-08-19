//
//  TDTaskListViewController.swift
//  ToDoApp-MVC-uik
//
//  Created by Israel Aguilar on 8/17/24.
//

import UIKit

class TDTaskListViewController: UIViewController {
    
    @IBOutlet weak var TDTaskListTableView: UITableView!
  
    let tdTasksManager = TDTaskDataManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        TDTaskListTableView.delegate = self
        TDTaskListTableView.dataSource = self
        tdTasksManager.fetchTDTask()
    }
}

//MARK: Delegate and data source methods
extension TDTaskListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tdTasksManager.countTDTask()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TDTaskCell", for: indexPath) as! TDTaskViewCell
        let tdTask = tdTasksManager.getTDTask(at: indexPath.row)
        cell.TDTaskTitle.text = tdTask.title
        cell.accessoryType = tdTask.isCompleted ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tdTasksManager.updateTDTaskCompletion(index: indexPath.row)
        let cell = tableView.cellForRow(at: indexPath)!
            
        cell.accessoryType =  tdTasksManager.getTDTask(at: indexPath.row).isCompleted ? .checkmark : .none
        cell.selectionStyle = .none
    }
}

