//
//  ListView.swift
//  ToDoList
//
//  Created by Furkan Pamukcu on 3.05.2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeOut(duration: 1.5)))
            } else{
                List{
                    ForEach(listViewModel.items) {item in
                        ListRowView(item: item)
                            .onTapGesture{
                                withAnimation(.spring){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
       
            .navigationTitle("To Do List")
            .navigationBarItems(leading: listViewModel.items.isEmpty ? nil : EditButton(),
                                trailing: listViewModel.items.isEmpty ? nil : NavigationLink("Add", destination: AddView()))
    }
 
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}


