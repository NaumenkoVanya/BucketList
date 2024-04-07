//
//  TouchIDFaceIDCV.swift
//  BucketList
//
//  Created by Ваня Науменко on 7.04.24.
//

import LocalAuthentication
import SwiftUI

struct TouchIDFaceIDCV: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform:
            authenticate
        )
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                if success {
                    isUnlocked = true
                } else {}
            }
        } else {}
    }
}

#Preview {
    TouchIDFaceIDCV()
}
