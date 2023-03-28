//
//  FeedView.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 17/03/2023.
//

import SwiftUI
import WaterfallGrid

struct FeedView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Image("LOGO")
                
                Spacer()
                
                Button {
                    coordinator.push(.search)
                } label: {
                    Image("search")
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            
            Divider()
                    
            List(viewModel.posts) { post in
                ListRow(post: post)
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .onAppear {
                viewModel.getFeedData()
            }
            .environmentObject(coordinator)
            
            Spacer()
        }
    }
}

struct ListRow: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    
    let post: Post
    @State private var isOpen1 = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image("three-girl-friends-having-pizza-bar 1")
                .onTapGesture {
                    coordinator.present(.image)
                }
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("name")
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.1137254902, green: 0.1607843137, blue: 0.2235294118, alpha: 1)))
                    .font(.system(size: 17))
                Text("time")
                    .foregroundColor(Color(#colorLiteral(red: 0.2784313725, green: 0.3294117647, blue: 0.4039215686, alpha: 1)))
                    .font(.system(size: 13))
            }
            Spacer()
            Button {
                print("pressed on dots")
            } label: {
                Image("dots")
            }
            
        }
        .padding(EdgeInsets(top: 8, leading: 0, bottom: 6, trailing: 0))
        
        Text(post.body)
            .foregroundColor(Color(#colorLiteral(red: 0.2039215686, green: 0.2509803922, blue: 0.3294117647, alpha: 1)))
            .font(.system(size: 17))
        
        imageItem()
        
        Divider()
    }
}

struct imageItem: View {
    
    @State var images = ["2", "3", "4", "5"]
    
    var body: some View {
        
        WaterfallGrid((2..<6), id: \.self) { index in
            Image("contentImage\(index)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

struct ImagePreviewView: View {
    
    var image: String
    var body: some View {
        
        Image(image)
            .frame(width: .infinity, height: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}
