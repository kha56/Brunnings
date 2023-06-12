//
//  CartView.swift
//  Brunnings
//
//  Created by Ivan Kha on 24/5/2023.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView
        {
            if cartManager.products.count > 0
            {
                ForEach(cartManager.products, id: \.id)
                {
                    product in
                    ProductRow(product: product)
                }
                HStack
                {
                    Text("You Cart Total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
                
            }else
            {
                //If the Cart is empty print out this
                Text("Your cart is empty")
            }
            
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
