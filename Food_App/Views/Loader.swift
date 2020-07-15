//
//  Loader.swift
//  Food_App
//
//  Created by praneeth vithanage on 7/15/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI

struct Loader :UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Loader>) ->UIActivityIndicatorView  {
        let indicator = UIActivityIndicatorView(style:.large)
        indicator.startAnimating()
        return indicator
    }
    func updateUIView(_ uiView:UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
