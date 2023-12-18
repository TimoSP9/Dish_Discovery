//
//  FirstPageView.swift
//  DishDiscovery
//
//  Created by MacBook Pro on 15/12/23.
//

import SwiftUI

struct FirstPageView: View {
    
   
    @Binding var currentPage: Int
    
    var body: some View {
        ZStack {
            Image("bg3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                Text("Discover \nCreate \nSavor")
                    .font(Font.custom("Jomolhari", size: 55))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(alignment: .center)
                    .lineSpacing(20)
                    .padding(.top, 150)
                Text("Discover a whole new world of flavor")
                    .font(Font.custom("Jomolhari", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(maxWidth: 258, alignment: .center)
                    .padding(.top, 130)
                Spacer()
                Button(action: {
                    currentPage = 1
                }){
                    Text("Get Started")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.bottom, 60)
            }
            .padding()
        }
    }
}
//
//#Preview {
//    FirstPageView(currentPage: $currentPage)
//}
