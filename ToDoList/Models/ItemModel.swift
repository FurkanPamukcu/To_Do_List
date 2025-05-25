//
//  ItemModel.swift
//  ToDoList
//
//  Created by Furkan Pamukcu on 3.05.2025.
//

import Foundation

struct ItemModel: Identifiable, Codable{
    let id: String
    let item: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, item: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.item = item
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, item: item, isCompleted: !isCompleted)
    }
}
