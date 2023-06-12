//
//  Navbar.swift
//  Brunnings
//
//  Created by Ivan Kha on 26/5/2023.
//

import SwiftUI

struct Navbar<Destination: View>: View {
    let image: Image
    let destination: Destination
    
    var body: some View {
        
        if destination is EmptyView
        {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 30)
                .padding(7)
        }
        else
        {
            NavigationLink(destination: AnyView(destination)) {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 30)
                    .padding(7)
                    
        }
        
        }
    }
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        HStack
        {
        
            Navbar(image: Image("Home"), destination: EmptyView())
        //BottomNavBarItem(image: Image("Cart")) {}
            

            Navbar(image: Image("Map"), destination: StoreLocationView())

       
        //BottomNavBarItem(image: Image("Profile")) {}
            Navbar(image: Image("Profile1"), destination: ProfileView())
        
        
        }
        .padding(8)
        .background(Color(UIColor(hexString: "#F8F8F8")))
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.15), radius: 8, x:2, y: 6)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}
