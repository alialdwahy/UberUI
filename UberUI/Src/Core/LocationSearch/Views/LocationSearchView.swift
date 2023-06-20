//
//  LocationSearchView.swift
//  UberUI
//
//  Created by ali gowi on 01/12/1444 AH.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewMode: LocationSearchViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6,height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1,height: 24)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6,height: 6)
                }
                VStack {
                    TextField("Cerrent location", text: $startLocationText)
                        .frame(height:32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewMode.queryFragment)
                        .frame(height:32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top,64)
            
            Divider()
                .padding(.vertical)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewMode.results, id: \.self) { result in
                        LocationSearchResultCell(title:result.title, subtitle:result.subtitle)
                            .onTapGesture {
                                viewMode.selectLocation(result)
                                mapState = .locationSelected
                               
                            }
                    }
                }
            }
            
        }
        .background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
    }
}
