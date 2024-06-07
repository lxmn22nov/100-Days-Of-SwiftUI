//
//  ContentView02.swift
//  BucketList
//
//  Created by Laxman Singh Koranga on 07/06/2024.
//

// OBJECTIVE: Switching view states with enums.
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
struct ContentView02: View {
    
    enum LoadingState {
        case loading, success, failed
    }
    
    @State private var loadingState = LoadingState.success
    
    var body: some View {
//        if Bool.random() {
//            Rectangle()
//        } else {
//            Circle()
//        }
        if loadingState == .loading {
            LoadingView()
        } else if loadingState == .success {
            SuccessView()
        } else if loadingState == .failed {
            FailedView()
        }
        // we can also use a "switch" block.
//        switch loadingState {
//        case .loading:
//            LoadingView()
//        case .success:
//            SuccessView()
//        case .failed:
//            FailedView()
//        }
    }
}

#Preview {
    ContentView02()
}
