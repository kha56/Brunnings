//
//  CartButton.swift
//  Brunnings
//
//  Created by Ivan Kha on 22/5/2023.
//

import SwiftUI

struct CartButton: View
{
    var numberOfProducts: Int

    var body: some View {
        ZStack(alignment: .topTrailing)
        {
            Image(systemName: "cart")
                .foregroundColor(Color(UIColor(hexString: "#FF5018")))
                .padding(.top, 5)
            
            if numberOfProducts > 0
            {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .cornerRadius(50)
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 1)
    }
}
