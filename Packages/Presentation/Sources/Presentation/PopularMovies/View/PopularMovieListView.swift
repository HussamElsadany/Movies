//
//  PopularMovieListView.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

import Combine
import Common
import SwiftUI

public struct PopularMovieListView: View {
    @ObservedObject var viewModel: PopularMovieListViewModel
    @State private var navigationDidAppearedForFirstTime = false

    public init(viewModel: PopularMovieListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.datasource) { movie in
                    NavigationLink(destination: MovieDetailsView(movie: movie)) {
                        MovieRow(movie: movie)
                    }
                }
                if viewModel.canFetchingMore {
                    Text("Fetching more...")
                        .onAppear(perform: {
                            self.viewModel.loadData()
                        })
                }
            }
            .navigationTitle(viewModel.title)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            if !navigationDidAppearedForFirstTime {
                viewModel.loadData()
                navigationDidAppearedForFirstTime = true
            }
        }
        .alert(isPresented: $viewModel.showError, content: {
            Alert(
                title: Text("alert_error_title".localized),
                message: Text(viewModel.errorMessage ?? "")
            )
        })
    }
}

struct MovieListView_Previews: PreviewProvider {
  static var previews: some View {
      PopularMoviesRouter.assemple()
  }
}
