//
//  AddView.swift
//  ToDoList
//
//  Created by Furkan Pamukcu on 3.05.2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            TextField("Type something here...", text: $textFieldText)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal, 14)
            
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased()).font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(textFieldText.count >= 3 ? Color.accentColor : Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal, 14)
                    .shadow(color: .gray.opacity(0.6), radius: 10, y: 10)
            }

        }
        .navigationTitle("Add an item")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }else{
            
        }

    }
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3{
            alertTitle = "You must enter something at least 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
        
    }
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
