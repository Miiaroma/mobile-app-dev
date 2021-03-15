//
//  ContentView.swift
//  Camera
//
//  Created by Miia Romanainen on 8.3.2021.
//

import SwiftUI

struct ContentView: View {
    @State var showImagePicker:Bool = false
    @State var showActionSheet:Bool = false
    @State var image:Image?
    @State var sourceType:Int = 0
    
    var body: some View {
        ZStack {
                VStack {
                          image?
                              .resizable()
                              .clipped()
                              .clipShape(Circle())
                              .aspectRatio(contentMode: .fill)
                              .frame(width: 160, height: 160)
                            Text("Photo")
                              .overlay(
                                  CameraButtonView(showActionSheet: $showActionSheet)
                                      .offset(x: 50, y: 65)
                          )
                      }.offset(y: -70)
                      Spacer()
    
                  .actionSheet(isPresented: $showActionSheet, content: { () -> ActionSheet in
                      ActionSheet(title: Text("Select Image"), message: Text("Please select photo from photo gallery or use the camera"), buttons: [
                          ActionSheet.Button.default(Text("Camera"), action: {
                              self.sourceType = 0
                              self.showImagePicker.toggle()
                          }),
                        ActionSheet.Button.default(Text("Photo Gallery"), action: {
                            self.sourceType = 1
                            self.showImagePicker.toggle()
                        }),
                        ActionSheet.Button.cancel()
                      ])
                  })
                  if showImagePicker {
                    ImagePicker(isVisible: $showImagePicker, image: $image, sourceType: sourceType)
                  }
              }
          }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
