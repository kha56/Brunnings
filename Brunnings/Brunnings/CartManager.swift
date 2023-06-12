//
//  CartManager.swift
//  Brunnings
//
//  Created by Ivan Kha on 24/5/2023.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    
    //Add the item to the cart
    func addToCart(product: Product, quantity: Int) {
            for _ in 0..<quantity {
                products.append(product)
            }
            updateTotal()
        }
    
    //Remove the item from the cart
    func removeFromCart(product: Product) {
        products.removeAll { $0.id == product.id }
        updateTotal()
    }
    
    //Total properly will alwyas reflect the correct total price based on the current state of the arrays
    private func updateTotal() {
        total = products.reduce(0) { $0 + $1.price }
    }
}
