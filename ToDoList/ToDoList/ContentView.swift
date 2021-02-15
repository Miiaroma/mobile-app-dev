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
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)){
                        ForEach(section.items) { item in
                            NavigationLink(destination: ItemDetail(item: item)){
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
        }
    }
}
