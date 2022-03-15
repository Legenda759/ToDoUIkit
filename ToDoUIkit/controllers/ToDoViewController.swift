//
//  ToDoViewController.swift
//  ToDoUIkit
//
//  Created by Legenda_759 on 07/03/22.
//

import UIKit
import SnapKit

class ToDoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let tableView = UITableView()
    var models = [ToDoListItem]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews() {
        getAllItems()
        tableViewSettings()
        title = "To Do UIKit"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        
    }
    
    func getAllItems() {
        do {
            models = try context.fetch(ToDoListItem.fetchRequest())
            tableView.reloadData()
        } catch {
//            error
        }
    }
    
    
    
//    MARK: - Table View
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableViewSettings() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ToDoTableViewCell
        cell.reload(item: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let ctrl = SaveViewController()
        let item = models[indexPath.row]
        if editingStyle == UITableViewCell.EditingStyle.delete {
           
            models.remove(at: indexPath.row)
            ctrl.deleteItem(item: item)
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
        }
    }
    
    
    

//      MARK: - Actions

    @objc private func didTapAdd() {
        let ctrl = SaveViewController()
        ctrl.complete = {
            self.getAllItems()
        }
       present(UINavigationController(rootViewController: ctrl), animated: true)
    }
    
}


