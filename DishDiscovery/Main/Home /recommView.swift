//
//  recommView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 21/12/23.
//

import SwiftUI


struct recommView: View {
    @Binding var currentPage : Int
    
    var body: some View {
        
        VStack{
            HStack{
                Button(action:{currentPage = 2}){
                    Text("<")
                }
                
                Text("Recommandation")
                    .font(.title2)
                    .bold()
                    
            }
            .frame(alignment: .topLeading)
            Spacer()
            ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(0..<100) {
                            Text("Row \($0)")
                        }
                    }
                }
        }
    }
}

//#Preview {
//    recommView()
//}
