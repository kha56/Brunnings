//
//  StoreLocationView.swift
//  Brunnings
//
//  Created by Ivan Kha on 26/5/2023.
//

import SwiftUI
import MapKit

struct StoreLocationView: View {
    @State private var storeLocations: [Store] = []
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -31.9047, longitude: 115.7978), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: storeLocations) { store in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: store.lat, longitude: store.long)) {
                Image(systemName: "mappin")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
                Text(store.name)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            fetchStoreLocations()
        }
    }
    
    private func fetchStoreLocations() {
        guard let url = URL(string: "https://data.tris.id.au/comp2010/assign2/StoreLocations.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Fetch failed:", error.localizedDescription)
                return
            }
            
            if let data = data {
                do {
                    storeLocations = try JSONDecoder().decode([Store].self, from: data)
                } catch {
                    print("Error decoding JSON:", error.localizedDescription)
                }
            }
        }.resume()
    }
}

struct StoreLocation_Previews: PreviewProvider {
    static var previews: some View {
        StoreLocationView()
    }
}

struct Store: Codable, Identifiable {
    let id = UUID()
    let name: String
    let lat: Double
    let long: Double
}

struct StoreLocationView_Previews: PreviewProvider {
    static var previews: some View {
        StoreLocationView()
    }
}
