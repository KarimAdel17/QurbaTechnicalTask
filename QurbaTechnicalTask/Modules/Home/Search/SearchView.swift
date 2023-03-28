//
//  SearchView.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 18/03/2023.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    
    @StateObject var viewModel = SearchViewModel()
        
    var body: some View {
        
        VStack {
            ZStack {
                HStack {
                    Button {
                        coordinator.pop()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.black)
                    }
                    
                    HStack {
                        Image("search")
                        TextField("", text: $viewModel.search, prompt: Text("Search"))
                            .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 9, leading: 12, bottom: 9, trailing: 0))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2).foregroundColor(Color(#colorLiteral(red: 0.8156862745, green: 0.8352941176, blue: 0.8666666667, alpha: 1))))
                    .onChange(of: viewModel.search) { newValue in
                        viewModel.getSearchResultsData()
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.search = ""
                    }) {
                        Image("close-circle")
                    }
                }
                .padding()
                
            }
            .padding(EdgeInsets(top: 4, leading: 16, bottom: 0, trailing: 16))
            
            Divider()
            
            List(viewModel.posts) { post in
                ListRow(post: post)
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .environmentObject(coordinator)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchView()
    }
}
