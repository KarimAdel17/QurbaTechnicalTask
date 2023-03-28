//
//  TabBar.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 17/03/2023.
//

import SwiftUI

struct TabBar: View {
    
    var body: some View {
        
        TabView {
            FeedView()
                .tabItem {
                    Image("home-2")
                }
            Text("Shop")
                .tabItem {
                    Image("shop")
                }
            Text("Discount")
                .tabItem {
                    Image("discount-shape")
                }
            Text("Gallery")
                .tabItem {
                    Image("gallery")
                }
            Text("Profile")
                .tabItem {
                    Image("profile")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
