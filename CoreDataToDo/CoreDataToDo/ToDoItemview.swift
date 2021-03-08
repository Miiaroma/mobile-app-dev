//
//  ToDoItemView.swift
//  CoreDataToDo
//
//  Created by Miia Romanainen on 8.3.2021.
//

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var cretedAt:String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(cretedAt)
                    .font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "My great todo",
            cretedAt: "Today")
    }
}
