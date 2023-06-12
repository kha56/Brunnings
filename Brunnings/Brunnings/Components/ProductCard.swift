//
//  ProductCard.swift
//  Brunnings
//
//  Created by Ivan Kha on 22/5/2023.
//

import SwiftUI

struct ProductCard: View {
    
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var body: some View {
        
        
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom)
            {
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                
                VStack(alignment: .leading)
                {
                    Text(product.name)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text("$\(product.price)")
                        .font(.caption)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .overlay(Color(UIColor(hexString: "#2A2A2F")).opacity(0.6))
                
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
        .shadow(radius: 3)
            
            
            Button
            {
                //Add it to cart
                cartManager.addToCart(product: product, quantity: 1)
            }
        label: {
                Image(systemName: "plus")
                .padding(10)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(50)
                .padding()
            
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
