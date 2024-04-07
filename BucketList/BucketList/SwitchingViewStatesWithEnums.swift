//
//  SwitchingViewStatesWithEnums.swift
//  BucketList
//
//  Created by Ваня Науменко on 7.04.24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}
struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}
struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}
struct SwitchingViewStatesWithEnums: View {
    enum LoadingState {
        case loading, succer, failed
    }
    @State private var loadingState = LoadingState.loading
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .succer:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

#Preview {
    SwitchingViewStatesWithEnums()
}
