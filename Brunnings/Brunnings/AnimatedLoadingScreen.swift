//
//  AnimatedLoadingScreen.swift
//  Brunnings
//
//  Created by Ivan Kha on 19/5/2023.
//

import SwiftUI

struct AnimatedLoadingScreen: View {
    
    @State private var isActive = false
    //Creating animation
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive
        {
            ContentView()
        }
        else
        {
            VStack
            {
                VStack
                {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                }
                
                .scaleEffect(size)
                .opacity(opacity)
                
                .onAppear()
                {
                    //This is for animation
                    withAnimation(.easeIn(duration: 1.2))
                    {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            
            .onAppear()
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
                {
                    withAnimation()
                    {
                        self.isActive = true
                    }
                }
            }
        }
            
    }
}

struct AnimatedLoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedLoadingScreen()
    }
}
