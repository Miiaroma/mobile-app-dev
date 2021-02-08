//
//  ContentView.swift
//  ToDoList
//
//  Created by Miia Romanainen on 8.2.2021.
//

import SwiftUI



struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List{
                ForEach(menu){ section in Text(section.name)
                    
                    ForEach(section.items) { item in Text(item.name)
                    }
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
