//
//  CellView.swift
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

