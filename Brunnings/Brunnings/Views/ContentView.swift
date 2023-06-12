//
//  ContentView.swift
//  Brunnings
//
//  Created by Ivan Kha on 17/5/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    
    //Array of toolSpecial objects
    @State private var toolSpecials: [ToolSpecial] = []
    
    //To track the product
    @State private var selectedProduct: Product?
    
    //Implementing search bar Menu
    @State private var searchText = ""

    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    HStack
                    {
                        HStack
                        {
                            Image("Search")
                                .padding(.trailing, 8)
                            TextField("Shovel,Fork", text: $searchText)
                            
                            Image("Adjuster")
                                .resizable()
                                .frame(maxWidth: 30, maxHeight: 30)
                            
                        }
                        
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .padding()
                        .offset(x: 0, y: -10)
                        
                        
                    }
                    
                    
                    
                    //Title of the specials
                    Text("Latest Specials")
                        .font(.custom("PlayfairDisplay-VariableFont_wght", size: 24))
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .offset(x:-96, y:10)
                    
                    //Add the products to a horizontal scroll view
                    ScrollView(.horizontal ,showsIndicators: false)
                    {
                        
                        HStack(spacing: 15)
                        {
                            
                            ForEach(toolSpecials) { toolSpecial in
                                        
                                            toolSpecialView(toolSpecial: toolSpecial, size: 210)
                                        
                                //.navigationBarHidden(true)
                                //Setting the colour of the text back to black
                                .foregroundColor(.black)
                                //Was having an error with frame not displaying fully
                                    //.frame(height:300)
                                    //.frame(width: 220, height: 700)
                                
                                
                            }
                            
                            .padding(.trailing,15)
                        }
                        .padding(.leading, 20)

                    }
                    .offset(x:-10,y:10)
                    
                    
                    //
                    Text("Products")
                        .font(.custom("PlayfairDisplay-VariableFont_wght", size: 24))
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .offset(x:-130, y:10)
                   
                    
            
                    
                    //Using LazyVGrid for improving performance when havign a large number of items
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(productList.filter({ product in
                            searchText.isEmpty ? true : product.name.lowercased().contains(searchText.lowercased())

                        }), id: \.id) { product in
                            
                            //Wrap the ProductCard with a NavigationLink
                            NavigationLink(destination: ProductDetailView(product: product), tag: product, selection: $selectedProduct) {
                                
                                ProductCard(product: product)
                                    .environmentObject(cartManager)
                            }
                        }
                    }
                    .padding()
                    .listStyle(PlainListStyle())
                }
                //.background(Color.white.ignoresSafeArea(.all))
                //Change the background color
                .background(Color(UIColor(hexString: "#f0f0f0")))
                .navigationTitle(Text("Brunnings"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: CartView().environmentObject(cartManager)) {
                            CartButton(numberOfProducts: cartManager.products.count)
                        }
                    }
                    
            }
                //Add theNav bar to to menu
                HStack {
                    Spacer()
                    Navbar(image: Image("Home"), destination: EmptyView())
                    Spacer()
                    Navbar(image: Image("Map"), destination: StoreLocationView())
                    Spacer()
                    Navbar(image: Image("Profile1"), destination: ProfileView())
                    Spacer()
                }

                .padding(8)
                .background(Color(UIColor(hexString: "#F8F8F8")))
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
            }
            .onAppear{
                loadData()
                //Reset the selected product when the view appears
                selectedProduct = nil
            }
            
        }
        
        .environmentObject(cartManager)
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    
 
    

    
    
    //Load the JSOn data for Special List of Items
    func loadData() {
            guard let url = URL(string: "https://data.tris.id.au/comp2010/assign2/ListSpecials.json") else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    return
                }

                do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            self.toolSpecials = try decoder.decode([ToolSpecial].self, from: data)
                    //Debugging
                            print("Successfully decoded JSON data")
                            print("Number of tool specials: \(self.toolSpecials.count)")
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
            }.resume()
        }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//This for ToolSpecial only
struct ToolSpecial: Codable, Identifiable
{
    let id = UUID()
    let productName: String
    let description: String
    let wasPrice: Double
    let nowPrice: Double
    let image: String
    
}

//layout for the special product view
struct toolSpecialView: View {
    let toolSpecial: ToolSpecial
    let size: CGFloat
    
    var body: some View {
        ZStack() {
            Image(systemName: toolSpecial.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: 200 * (size / 210))
                .cornerRadius(20.0)
                .blur(radius: 1.5)
            
            VStack {
                Text(toolSpecial.productName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    .padding(.top, 5)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .padding(.bottom, 5)
                
                HStack {
                    Text("Was: $\(String(format: "%.2f", toolSpecial.wasPrice))")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .strikethrough()
                    
                    Text("Now: $\(String(format: "%.2f", toolSpecial.nowPrice))")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.red) // Set the text color to red
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}
