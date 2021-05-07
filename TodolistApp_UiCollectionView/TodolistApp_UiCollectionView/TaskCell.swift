//
//  TaskCell.swift
//  TodolistApp_UiCollectionView
//
//  Created by Mospeng Research Lab Philippines on 5/25/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

class TaskCell: BaseCell {
    
    let taskNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setUpViews() {
        super.setUpViews()
        
        addSubview(taskNameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: .init(), metrics: nil, views: ["v0": taskNameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: .init(), metrics: nil, views: ["v0": taskNameLabel]))
    }
}
