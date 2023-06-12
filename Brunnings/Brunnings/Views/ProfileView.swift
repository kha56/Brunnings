//
//  ProfileView.swift
//  Brunnings
//
//  Created by Ivan Kha on 26/5/2023.
//

import SwiftUI

struct ProfileView: View {
    
    
    //OffSet variables
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 20
    
    var body: some View {
        VStack
        {
            ZStack
            {
                //Background Color Goes here
                Color(UIColor(hexString: "#f6f6f6"))
                    .edgesIgnoringSafeArea(.all)
                
                VStack
                {
                    
                    //Make the barcode blend in with the background
                    Image("Barcode")
                        .resizable()
                        .scaledToFit()
                        .colorMultiply(Color(UIColor(hexString: "#f6f6f6")))
                        .edgesIgnoringSafeArea(.top)
                        .offset(x: xOffset, y: yOffset)
                    
                    Text("Please show the barcode at the front of the counter thank you. Make sure the screen is not dirty when showing this.")
                        .font(.system(size: 11).italic())
                        .offset(x: 0, y: 100)
                        .frame(width: 260)
                        .multilineTextAlignment(.center)
                        .opacity(0.5)
                    
                    Text("578727478489274H67")
                        .font(Font.system(size: 16))
                        .offset(x:0, y:-40)
                        
                    
                    VStack(alignment: .leading)
                    {
                            Text("Member Details")
                                .font(.system(size:20))
                                .font(.title)
                                .fontWeight(.bold)
    
                    
                                //.offset(x:-70, y:40)
                        
                        
                        VStack(alignment: .leading)
                        {
                            Divider()
                            
                            HStack{
                                Text("Name")
                                    .opacity(0.5)
                                Text("                                                      Ivan Kha")
                                    .fontWeight(.semibold)
                                    
                            }
                            Divider()
                            
                            HStack{
                                Text("Points")
                                    .opacity(0.5)
                                Text("                                                            418P")
                                    .fontWeight(.semibold)
                                    
                            }
                            //Divider()
                           
                            Divider()
                            HStack
                            {
                                Text("Member Since")
                                    .opacity(0.5)
                                Text("                                            2023")
                                    .fontWeight(.semibold)
                            }
                            Divider()
                            
                            HStack
                            {
                                Text("Location")
                                    .opacity(0.5)
                                Text("                                                 Australia")
                                    .fontWeight(.semibold)
                            }
                        
                            Divider()
                                .padding(50)
                            
                            
                            
                            
                            
                            
                        }
                        .padding(.top, 10)
                        
            
                    }
                    
                    .padding()
                    .background(Color.white)
                    .cornerRadius(40.0)
                    .offset(x:0, y:180)
                   
                    
                }
               
                
            }
            
        
        }

       
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
