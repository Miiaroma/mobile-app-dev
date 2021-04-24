//
//  MemoryView.swift
//  Calculator
//
//  Created by Miia Romanainen on 19.4.2021.
//

import SwiftUI

struct MemoryView: View {
    @Environment(\.managedObjectContext)var managedObjectContext
    @FetchRequest(fetchRequest: MemoryItem.getAllMemoryItems()) var memoryItems:FetchedResults<MemoryItem>
        
        @State private var newMemoryItem = ""
    
    var body: some View {
            NavigationView {
                List{
                    Section(header: Text("Calculations")){
                        ForEach(self.memoryItems) {MemoryItem in
                            MemoryItemView(title: MemoryItem.title!, cretedAt: "\(MemoryItem.createdAt!)")
                        }.onDelete {IndexSet in
                            let deleteitem = self.memoryItems[IndexSet.first!]
                            self.managedObjectContext.delete(deleteitem)
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Calculation History"))
                .navigationBarItems(trailing: EditButton())
            }
        }
    
}

struct MemoryView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView()
    }
}
