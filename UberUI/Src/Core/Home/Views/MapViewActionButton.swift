//
//  MapViewActionButton.swift
//  UberUI
//
//  Created by ali gowi on 01/12/1444 AH.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    var body: some View {
        Button {
            withAnimation(.spring()){
               actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        
        .frame(maxWidth: .infinity, alignment:  .leading)
}
    
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            print("DEBUG: No input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected:
            mapState = .noInput
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        case .noInput:
           return  "line.3.horizontal"
        case .searchingForLocation,
        .locationSelected:
           return "arrow.left"
        }
    }
    

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
    }
}
