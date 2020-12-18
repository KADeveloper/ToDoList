//
//  NewTaskViewModel.swift
//  ToDoList
//
//  Created by Динара Аминова on 17.12.2020.
//

import Foundation
import RealmSwift

struct NewTaskViewModel {
    private let realm = try! Realm()
    
    func saveToDoTask(title: String, description: String) {
        let newTask = RealmModel()
        newTask.taskName = title
        newTask.taskDescription = description
        try? realm.write {
            realm.add(newTask)
        }
    }
}
