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
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ??
    false
    var body: some View {
        VStack{
          if status{
            NavigationView{
                Home().navigationBarTitle("Home",displayMode:.inline)
                      .navigationBarItems(trailing:
                        Button(action:{
                            }, label:{
                                Image(systemName: "cart.fill").font(.body).foregroundColor(.black)
                            })
                
                )
            }
                
            }
            else{
                NavigationView{
                 FirstPage()
            }
            }
            
           
        }.onAppear{
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChanage"), object: nil, queue: .main){
                (_)in
                
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ??
                false
                
                self.status = status
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


class getCategoriesData :ObservableObject{
    
    @Published var datas = [category]()
    init() {
        
    
     let db = Firestore.firestore()
       
        db.collection("categories").addSnapshotListener{(snap,err)in
           if err != nil{
               print((err?.localizedDescription))
               return
           }
            for  i in snap!.documentChanges{
                let id = i.document.documentID
                let name = i.document.get("name") as!String
                let price = i.document.get("price") as!String
                let pic = i.document.get("pic") as!String
               
                self.datas.append(category(id: id, name: name, price: price, pic: pic))
            }
         }
       }
    
    }

struct category : Identifiable {
      var id : String
      var name : String
      var price : String
      var pic : String
}
