//
//  ContentView.swift
//  CoreDataToDo
//
//  Created by Miia Romanainen on 8.3.2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext)var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    
    @State private var newTodoItem = ""
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("What's next?")){
                    HStack{
                         TextField("New item", text: self.$newTodoItem)
                            Button(action: {
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newTodoItem
                            toDoItem.createdAt = Date()
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            
                            self.newTodoItem = ""
    
                         }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                            }
                            .disabled(newTodoItem.isEmpty)
                    }
                }.font(.headline)
                Section(header: Text("To Do's")){
                    ForEach(self.toDoItems) {ToDoItem in
                        ToDoItemView(title: ToDoItem.title!, cretedAt: "\(ToDoItem.createdAt!)")
                    }.onDelete {IndexSet in
                        let deleteitem = self.toDoItems[IndexSet.first!]
                        self.managedObjectContext.delete(deleteitem)
                        
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
