//
//  TestingView.swift
//  Brunnings
//
//  Created by Ivan Kha on 26/5/2023.
//

import SwiftUI

struct TestingView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    LazyVStack {
                        ForEach(1...16, id: \.self) {
                            Text("\($0)")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor.systemGray6))
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Brunnings")
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "cart")
                    }
                }
                HStack {
                    Spacer()
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Spacer()
                    Image(systemName: "map.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Spacer()
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Spacer()
                }
                .padding()
                .background(Color.red)
                .clipShape(Capsule())
                .padding()
            }
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
