//
//  ListViewModelProtocol.swift
//  
//
//  Created by Hussam Elsadany on 23/01/2023.
//

import Combine

protocol ListViewModelProtocol: ObservableObject {
    associatedtype DataItem

    var title: String { get }
    var datasource: DataItem { get }
    var showError: Bool { get }
    var errorMessage: String? { get }
    func loadData()
}
