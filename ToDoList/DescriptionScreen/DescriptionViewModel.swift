//
//  DescriptionViewModel.swift
//  ToDoList
//
//  Created by Динара Аминова on 17.12.2020.
//

import Foundation
import RealmSwift

struct DescriptionViewModel {
    private let realm = try! Realm()
    var model = RealmModel()
    
    init(model: RealmModel) {
        self.model = model
    }
    
    func changeTaskStatus(){
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        let minute = calendar.component(.minute, from: Date())
        let day = calendar.component(.day, from: Date())
        let month = calendar.component(.month, from: Date())
        let year = calendar.component(.year, from: Date())
        
        do {
            try realm.write {
                model.isDone = !model.isDone
                model.timeWhenCompleted = "\(hour):\(minute)"
                model.dateWhenCompleted = "\(day).\(month).\(year)"
            }
        } catch {
            print("Can't save status, \(error.localizedDescription)")
        }
    }
}
