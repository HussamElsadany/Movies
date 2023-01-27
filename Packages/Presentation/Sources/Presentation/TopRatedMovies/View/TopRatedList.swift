//
//  TopRatedList.swift
//  Movies
//
//  Created by xdmgzdev on 16/04/2021.
//

import SwiftUI

struct TopRatedList: UIViewControllerRepresentable {

  func makeUIViewController(context _: Context) -> UINavigationController {
      let viewController = TopRatedMoviesRouter.assemple()!
      let navigationController = UINavigationController(rootViewController: viewController)
      return navigationController
  }

  func updateUIViewController(
    _: UINavigationController,
    context _: Context
  ) {
    // Nothing to do here, since our view controller is
    // read-only from the outside.
  }
}
