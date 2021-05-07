//
//  TodolistCollectionViewController.swift
//  TodolistApp_UiCollectionView
//
//  Created by Mospeng Research Lab Philippines on 5/25/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

class TodolistCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var tasks = [String]()
    let cellIndentifier = "taskCell"
    let headerCellIdentifier = "taskHeaderCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "To-Do List"
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true // It allows collection view to always scrollable vertically
        
        registerCells()
    }
    
    func registerCells() {
        // Header
        collectionView.register(TaskHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellIdentifier)
        // Cell
        collectionView.register(TaskCell.self, forCellWithReuseIdentifier: cellIndentifier)
    }
    
    // - - - Header - - -
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let taskHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellIdentifier, for: indexPath) as! TaskHeaderCell
        taskHeaderCell.todolistCollectionViewController = self
        return taskHeaderCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    // - - - Header - - -
    
    
    // - - - Cell - - -
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let taskCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIndentifier, for: indexPath) as! TaskCell
        taskCell.taskNameLabel.text = tasks[indexPath.item]
        return taskCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    // - - - Cell - - -

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func addNewTask(taskName: String) {
        tasks.append(taskName)
        collectionView?.reloadData()
    }
}

