//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Динара Аминова on 15.12.2020.
//

import Foundation
import RealmSwift

struct ListViewModel {
    private let realm = try! Realm()
    let taskTypeNames = ["In active", "Completed"]
    
    func getTask() -> Results<RealmModel> {
        return realm.objects(RealmModel.self).sorted(byKeyPath: "taskName")
    }
    
    func activeTasks() -> Results<RealmModel> {
        return realm.objects(RealmModel.self).filter("isDone = false").sorted(byKeyPath: "taskName",ascending: true)
    }
    
    func completedTasks() -> Results<RealmModel> {
        return realm.objects(RealmModel.self).filter("isDone = true").sorted(byKeyPath: "taskName", ascending: true)
    }

    func delete(task: RealmModel){
        do {
            try realm.write {
                realm.delete(task)
            }
        } catch {
            print("Error deleting task, \(error)")
        }
    }

}
