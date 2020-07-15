//
//  getCartData.swift
//  Food_App
//
//  Created by praneeth vithanage on 7/15/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore


class getCartData : ObservableObject{
    @Published var datas = [cart]()
    init(){
        
        let db = Firestore.firestore()
        db.collection("cart").getDocuments{(snap,err)in
                       
                               
                               if err != nil {
                                   print((err?.localizedDescription)!)
                                   return
                        }
            for i in snap!.documents{
                let id = i.documentID
                let name = i.get("item")as! String
                let quantity = i.get("quantity")as! NSNumber
                let pic = i.get("pic")as! String
                
                self.datas.append(cart(id: id, name: name, quantity: quantity, pic: pic))
                  }
                }
          }
}
