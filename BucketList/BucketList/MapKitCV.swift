//
//  MapKitCV.swift
//  BucketList
//
//  Created by Ваня Науменко on 7.04.24.
//

import MapKit
import SwiftUI

// MARK: - Location

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

let location = [
    Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
    Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
]

// MARK: - MapKitCV

struct MapKitCV: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    var body: some View {
        MapReader { proxy in
            Map()
                .onTapGesture {
                    position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        print(coordinate)
                    }
                }
        }
        
//        Map {
//            ForEach(location) { location in
//                Annotation(location.name, coordinate: location.coordinate) {
//                    Text(location.name)
//                        .font(.headline)
//                        .padding()
//                        .background(.blue)
//                        .foregroundStyle(.white)
//                        .clipShape(.capsule)
//                }
//                .annotationTitles(.hidden)
//                Marker(location.name, coordinate: location.coordinate)
            }
        }
//        VStack {
//            Map(position: $position)
//                .onMapCameraChange(frequency: .continuous) {
//                    context in
//                    print(context.region)
//                }
//            HStack {
//                Button("Paris") {
//                    position = MapCameraPosition.region(
//                        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
//                    )
//                }
//                Button("Tokyo") {
//                    position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
//                }
//                Button("London") {
//                    position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
//                }
//            }
//        }

//        Map(interactionModes: [])
//        Map()
//            .mapStyle(.hybrid(elevation: .realistic))
//    }
//}

#Preview {
    MapKitCV()
}
