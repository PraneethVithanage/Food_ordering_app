//
//  OrderView.swift
//  Food_App
//
//  Created by praneeth vithanage on 7/15/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore
import SDWebImageSwiftUI

struct OrderView : View {
   var data : category
    @State var cash = false
    @State var quick = false
    @State var quantity = 0
    @Environment(\.presentationMode) var presentation
   var body : some View{
       VStack(alignment:.leading,spacing: 15){
           AnimatedImage(url: URL(string:data.pic)!).resizable().frame(height:UIScreen.main.bounds.height / 2 - 100)
           VStack(alignment:.leading, spacing: 25){
               Text( data.name).font(.title).fontWeight(.heavy).foregroundColor(.white)
               Text( data.price).font(.title).font(.body).foregroundColor(.white)
               
               Toggle(isOn:$cash){
                   Text("Cash on Delivery").foregroundColor(.white)
               }
               Toggle(isOn:$quick){
                  Text("Quick Delivery").foregroundColor(.white)
                       }
               Stepper(onIncrement:{
                   self.quantity += 1
                   
               }, onDecrement:{
                   if self.quantity != 0 {
                   self.quantity -= 1
                   }
                   
               })
               {
                   Text("Quantity \(self.quantity)").foregroundColor(.white)
               }
            }
           Button(action:{
               
               let db = Firestore.firestore()
               db.collection("cart").document()
                   .setData(["item":self.data.name,"quantity":self.quantity,"quickdelivery":self.quick,"cashondelivery": self.cash ,"pic":self.data.pic]){(err) in
                       
                       if err != nil {
                           print((err?.localizedDescription)!)
                           return
                       }
                       
                       self.presentation.wrappedValue.dismiss()
                       
               }
               
           }){
               Text("Add To Cart")
                   .padding(.vertical).frame(width:UIScreen.main.bounds.width-30)
                  
           }.background(Color.green)
               .foregroundColor(.white)
               .cornerRadius(20)
           Spacer()
           
       }.padding()
          .background(
           Image("background")
               .resizable()
               .edgesIgnoringSafeArea(.all)
           )
       
   }
}


