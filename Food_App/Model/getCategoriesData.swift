//
//  getCategoriesData.swift
//  Food_App
//
//  Created by praneeth vithanage on 7/15/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

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


 
