//
//  MovieDetailsView.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

import Domain
import SwiftUI

struct MovieDetailsView: View {
    var movie: PopularMovie

    @Environment(\.presentationMode) var presentation

    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .leading) {
                Image(uiImage: movie.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    .clipped()
                    .overlay(
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Button(action: {
                                    presentation.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "arrow.left")
                                        .font(.system(size: 32))
                                })

                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top, 40)

                            Spacer()

                            Text(movie.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal)

                        }
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.124825187, green: 0.1294132769, blue: 0.1380611062, alpha: 1)), Color.clear]), startPoint: .bottom, endPoint: .top))
                    )

                Text(movie.overview)
                    .foregroundColor(.gray)
                    .padding()

                Spacer()
            }
        })
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
    }
}
