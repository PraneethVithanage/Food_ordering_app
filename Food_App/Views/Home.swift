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

struct CellView:View {
    var data : category
    @State var show = false
    var body : some View {
        VStack{
                                   
                AnimatedImage(url: URL(string: data.pic)!).resizable().frame(height:270)
                HStack{
                    VStack(alignment: .leading){
                        Text( data.name).font(.title).fontWeight(.heavy).foregroundColor(.white)
                        Text( data.price).font(.title).font(.body).foregroundColor(.white)
                                       }
                                       
                                       Spacer()
                                       
                                       Button(action:{
                                        
                                        self.show.toggle()
                                           
                     }){
                            Image(systemName: "arrow.right")
                                .font(.body)
                                .foregroundColor(.black)
                                .padding(14)
                                }.background(Color.white).clipShape(Circle())
                    }.padding(.horizontal)
                     .padding(.bottom,6)
        }.background(Color("Color2").edgesIgnoringSafeArea(.all))
        .cornerRadius(20)
            .sheet(isPresented:self.$show){
                OrderView(data:self.data)
        }
    }
}

struct Loader :UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Loader>) ->UIActivityIndicatorView  {
        let indicator = UIActivityIndicatorView(style:.large)
        indicator.startAnimating()
        return indicator
    }
    func updateUIView(_ uiView:UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        
    }
}

struct OrderView : View {
    var data : category
     @State var cash = false
     @State var quick = false
     @State var quantity = 0
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
                    Text("Quantity\(self.quantity)").foregroundColor(.white)
                }
             }
            Button(action:{
                
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

