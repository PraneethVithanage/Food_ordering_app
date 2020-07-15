//
//  CartView.swift
//  Food_App
//
//  Created by praneeth vithanage on 7/15/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartView:View {
    @ObservedObject var cartdata = getCartData()
    var body: some View{
        VStack(alignment: .leading){
            
            Text(self.cartdata.datas.count != 0 ? "Item In the Cart" : "No item in the cart").padding([.top,.leading])
            if self.cartdata.datas.count != 0{
                List(self.cartdata.datas){i in
                    HStack(spacing: 15){
                        AnimatedImage(url:URL(string: i.pic)).resizable().frame(width:55, height: 55).cornerRadius(10)
                        
                        VStack(alignment: .leading){
                            Text(i.name)
                            Text("\(i.quantity)")
                        }
                    }
                }
            }
            }.frame(width:UIScreen.main.bounds.width - 110,height:UIScreen.main.bounds.height-350)
            .background(Color.white)
            .cornerRadius(25)
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
