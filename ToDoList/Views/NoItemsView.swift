//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Furkan Pamukcu on 3.05.2025.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                Text("What are you waiting for? Click the Add button to add your first item!")
                    .font(.subheadline)
                    .padding(.bottom, 30)
                NavigationLink(destination: AddView(),
                               label: {
                    Text("Add Something")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : Color.accentColor)
                        .cornerRadius(animate ? 40 : 10)
                })
                .padding(.horizontal, animate ? 80 : 30)
                .shadow(
                    color: animate ? Color.red.opacity(0.6) : Color.accentColor.opacity(0.6),
                    radius: animate ? 40 : 20,
                    y: animate ? 20 : 10)
                .scaleEffect(animate ? 1.2 : 1.0)
            }
            .padding(40)
            .onAppear{
                addAnimation()
            }
        }
        .multilineTextAlignment(.center)
    }
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView{
        NoItemsView()
            .navigationTitle("Title")
    }
}
