//
//  recommView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 21/12/23.
//

import SwiftUI


struct recommView: View {
    let data = Array(1...100)
    
    var body: some View {
        
        VStack{
            Text("Recommandation")
                .font(.title)
                .bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2)) {
                    ForEach(data, id: \.self) { item in
                        Text("Item \(item)")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
        }
    }
}

//#Preview {
//    recommView()
//}
