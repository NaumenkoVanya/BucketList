//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Ваня Науменко on 8.04.24.
//
import LocalAuthentication
import Foundation
import MapKit
import CoreLocation

extension AddingUserLocationsMap {
    @Observable
    class ViewModel {
        private(set) var locations: [LocationOne]
        var selectedPlace: LocationOne?
        var isUnlocked = false
        
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([LocationOne].self, from: data)
            } catch {
                locations = []
            }
        }
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }

        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = LocationOne(id: UUID(), name: "New location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
            save()
        }
        func update(location: LocationOne) {
            guard let selectedPlace else {return}
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        self.isUnlocked = true
                    } else {
                        //ошибка
                    }
                }
            } else {
                // нет биометрии
            }
        }
    }
}
