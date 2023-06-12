//
//  ProductDetailView.swift
//  Brunnings
//
//  Created by Ivan Kha on 27/5/2023.
//

import SwiftUI

struct ProductDetailView: View {
    //acccess the cartManager
    @EnvironmentObject var cartManager: CartManager
    
    @State private var quantity: Int = 1
    
    let product: Product
    var body: some View {
        
        
        
        ProductDetailScreen(
                            product: product,
                            addToCartAction: {
                                cartManager.addToCart(product: product, quantity: quantity)
                            },
                            quantity: $quantity  // Add this line
                        )
                   
    }
}

//Creating UI for the product Detail Product View
//Custom Extension for adjusting the shape of a frame
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
      
        
        let product = Product(name: "Example Product", image: "Tool1", price: 20, description: "This is the top notch Example product")
        ProductDetailView(product: product)
        
    }
}

struct DescriptionView: View {
    @State private var isWrapped: Bool = false
    
    @Binding var quantity: Int//Gotta change the quantity
    
    let product: Product //Might have to watch out for this
    
    var body: some View {
        VStack(alignment: .leading)
        {
            Text(product.name)
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 4)
            {
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("Star")
                        .resizable()
                        .frame(width: 20,height: 20)
                    
                }
                Spacer()
                
            }
            
            
            Text("Product Desription")
                .fontWeight(.medium)
                .font(Font.system(size: 18))
                .padding(.vertical,8)
            
            Text(product.description)
                .lineSpacing(8.0)
                .opacity(0.6)
            
            
            VStack
            {
                HStack(alignment: .bottom)
                {
                    Button(action: { isWrapped.toggle() }) {
                        Image(systemName: isWrapped ? "checkmark.square.fill" : "square")
                            .padding(.all, 8)
                    }
                    .frame(width: 30, height: 30)
                    .background(Color(UIColor(hexString: "FF5018")))
                    .foregroundColor(Color(UIColor(hexString: "FFFFFF")))
                    .cornerRadius(6)
                    
                    Text("Wrapping")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 3)
                    
                    Spacer()
                    
                    Button(action: {
                        if quantity > 0 {
                            quantity -= 1
                        }
                    }) {
                        Image(systemName: "minus")
                            .padding(.all, 8)
                    }
                    .frame(width: 30, height: 30)
                    .background(Color(UIColor(hexString: "FF5018")))
                    .foregroundColor(Color(UIColor(hexString: "FFFFFF")))
                    .cornerRadius(6)
                    
                    
                    Text("\(quantity)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 3)
                    
                    Button(action: { quantity += 1 }) {
                        Image(systemName: "plus")
                            .padding(.all, 8)
                    }
                    .frame(width: 30, height: 30)
                    .background(Color(UIColor(hexString: "FF5018")))
                    .foregroundColor(Color(UIColor(hexString: "FFFFFF")))
                    .cornerRadius(6)
                }
                .padding(.horizontal, 20)
            }
                .offset(y:10)
            
        }
        
        .padding()
        .padding(.top)
        .background(Color(UIColor(hexString: "f0f0f0")))
        .cornerRadius(40)
    }
}


struct ProductDetailScreen: View {
    let product: Product
    let addToCartAction: () -> Void
    
    @Binding var quantity: Int
    
    var body: some View {
        
        @EnvironmentObject var cartManager: CartManager

        
        ZStack
        {
            Color(UIColor(hexString: "#f0f0f0"))
                .edgesIgnoringSafeArea(.all)
            
            ScrollView
            {
                Image((product.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                     
                DescriptionView(quantity: $quantity, product: product)//Add the product here
                    .offset(y:-40)
            }
            .edgesIgnoringSafeArea(.top)

            
            HStack
            {
                Text("$\(product.price)")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: addToCartAction) {
                                Text("Add to Cart")
                                    .padding()
                                    .padding(.horizontal)
                                    .background(Color(UIColor(hexString: "#FF5018")))
                                    .cornerRadius(10.0)
                                    .foregroundColor(Color.white)
                            }
            }
            .padding()
            .padding(.horizontal)
            .background(Color(UIColor(hexString: "#2A2A2F")))
            //Adding custom shapness to the bottom cart bar
            .cornerRadius(50, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
