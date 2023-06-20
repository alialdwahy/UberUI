//
//  UberUIApp.swift
//  UberUI
//
//  Created by ali gowi on 01/12/1444 AH.
//

import SwiftUI

@main
struct UberUIApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
