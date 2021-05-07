//
//  TaskHeaderCell.swift
//  TodolistApp_UiCollectionView
//
//  Created by Mospeng Research Lab Philippines on 5/25/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

class TaskHeaderCell: BaseCell {
    
    var todolistCollectionViewController: TodolistCollectionViewController?
    
    let taskNameTextField: UITextField = {
        let tntf = UITextField()
        tntf.layer.borderWidth = 1
        tntf.layer.borderColor = UIColor.darkGray.cgColor
        tntf.placeholder = "Enter Task Name.."
        tntf.borderStyle = .roundedRect
        tntf.translatesAutoresizingMaskIntoConstraints = false
        return tntf
    }()
    
    let addTaskButton: UIButton = {
        let atb = UIButton(type: .system)
        atb.layer.borderWidth = 1
        atb.layer.borderColor = UIColor.link.cgColor
        atb.layer.cornerRadius = 5
        atb.layer.shadowOpacity = 0.2
        atb.layer.shadowOffset = CGSize(width: 0,height: 0)
        atb.setTitle("Add Task", for: .normal)
        atb.translatesAutoresizingMaskIntoConstraints = false
        return atb
    }()
    
    override func setUpViews() {
        
        addSubview(taskNameTextField)
        addSubview(addTaskButton)
        
        addTaskButton.addTarget(self, action: #selector(addTaskButtonTapped), for: .touchUpInside)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-[v1(80)]-8-|", options: .init(), metrics: nil, views: ["v0": taskNameTextField, "v1": addTaskButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-24-[v0]-24-|", options: .init(), metrics: nil, views: ["v0": taskNameTextField]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-24-[v0]-24-|", options: .init(), metrics: nil, views: ["v0": addTaskButton]))
    }
    
    @objc func addTaskButtonTapped() {
        guard let taskName = taskNameTextField.text else { return }
        
        if taskName != "" {
            todolistCollectionViewController?.addNewTask(taskName: taskName)
        }
        
        taskNameTextField.text = ""
    }
}

