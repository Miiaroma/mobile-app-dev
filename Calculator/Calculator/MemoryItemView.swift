//
//  MemoryItemView.swift
//  Calculator
//
//  Created by Miia Romanainen on 19.4.2021.
//

import SwiftUI

struct MemoryItemView: View {
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

struct MemoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryItemView(title: "Calculation history",
                                   cretedAt: "Today")
    }
}
