//
//  RealmModel.swift
//  ToDoList
//
//  Created by Динара Аминова on 17.12.2020.
//

import RealmSwift

class RealmModel: Object {
    @objc dynamic var taskName = ""
    @objc dynamic var taskDescription = ""
    @objc dynamic var isDone: Bool = false
    @objc dynamic var timeWhenCompleted = ""
    @objc dynamic var dateWhenCompleted = ""
}
