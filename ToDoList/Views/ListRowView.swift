//
//  ListRowView.swift
//  ToDoList
//
//  Created by Furkan Pamukcu on 3.05.2025.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.item)
            Spacer()
        }
    }
}

#Preview {
    Group{
        ListRowView(item: ItemModel(item: "Deneme", isCompleted: true))
        ListRowView(item: ItemModel(item: "Deneme 2", isCompleted: false))
    }
}
