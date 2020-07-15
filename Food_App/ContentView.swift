//
//  ContentView.swift
//  Chatapp
//
//  Created by praneeth vithanage on 7/8/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//
import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore


struct ContentView: View {
    
   @State var show = false
    var body: some View {
        ZStack{

                    
                      NavigationView{
                          Home().navigationBarTitle("Home",displayMode:.inline)
                                .navigationBarItems(trailing:
                                  Button(action:{
                                    self.show.toggle()
                                      }, label:{
                                          Image(systemName: "cart.fill").font(.body).foregroundColor(.black)
                                      })
                          
                          )
                      }
                          
                  

                if self.show{
                      GeometryReader{_ in
                          CartView()
                          
                      }.background(Color.black.opacity(0.55).edgesIgnoringSafeArea(.all)
                          .onTapGesture {
                              self.show.toggle()
                       }
                      )
                }
           }.animation(.linear(duration:1.0))
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





