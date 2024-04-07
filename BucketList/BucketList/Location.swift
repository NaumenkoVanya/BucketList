//
//  Location.swift
//  BucketList
//
//  Created by Ваня Науменко on 7.04.24.
//

import Foundation
import MapKit

struct LocationOne: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
     static let example = LocationOne(id: UUID(), name: "Buckingham Palace", description: "Lit by over 40,000 lightbulbs.", latitude: 51.501, longitude: -0.141)
    static func ==(lhs: LocationOne, rhs: LocationOne) -> Bool {
        lhs.id == rhs.id
    }
}
