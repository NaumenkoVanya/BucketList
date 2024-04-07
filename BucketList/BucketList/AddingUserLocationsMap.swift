//
//  AddingUserLocationsMap.swift
//  BucketList
//
//  Created by Ваня Науменко on 7.04.24.
//

import MapKit
import SwiftUI

struct AddingUserLocationsMap: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))
    
    @State private var locations = [LocationOne]()
    @State private var selectedPlace: LocationOne?

    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition){
                ForEach(locations){ location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture{
                                selectedPlace = location
                            }
                    }
//                    Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                }
            }
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        let newLocation = LocationOne(id: UUID(), name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                        locations.append(newLocation)
                    }
                }
                .sheet(item: $selectedPlace) { place in
                    EditView(location: place) { newLocation in
                        if let index = locations.firstIndex(of: place) {
                            locations[index] = newLocation
                        }
                    }
                }
        }
        
    }
}

#Preview {
    AddingUserLocationsMap()
}
