//
//  Home.swift
//  Chatapp
//
//  Created by praneeth vithanage on 7/10/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//
import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore
import SDWebImageSwiftUI

struct Home : View {
    @ObservedObject var categories = getCategoriesData()
   
    
    var body : some View {
        VStack{
            Text("Welcome\(UserDefaults.standard.value(forKey: "UserName")as! String)")
            
            
            Button(action:{
                try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name:NSNotification.Name("statusChanage"),object:nil)
            }, label: {
                
                Text("Sign Out")
                
            })
            
            if self.categories.datas.count != 0{
                ScrollView(.vertical,showsIndicators: false){
                VStack(spacing: 15){
                    ForEach(self.categories.datas){ i in
                       
                        CellView(data:i)
                      }
                    }.padding()
                    
                }.background(
                    Image("background")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        
                )
            }
            else{
                Loader()
            }
        }
        
    }
    
}







