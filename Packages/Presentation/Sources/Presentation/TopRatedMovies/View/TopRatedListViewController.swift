//
//  TopRatedListViewController.swift
//  Movies
//
//  Created by xdmgzdev on 16/04/2021.
//

import UIKit
import Combine

//MARK: - TopRatedListViewController
public class TopRatedListViewController: UITableViewController {

    var viewModel: TopRatedMovieViewModel!
    private var cancellable: AnyCancellable?
    private let rowHeight: CGFloat = 140

    // MARK: Object lifecycle
    public init(viewModel: TopRatedMovieViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        viewModelDidChange()
        viewModel.loadData()
    }

    // MARK: Setup View
    private func setupView() {
        tableView.register(TopRatedTableviewCell.self, forCellReuseIdentifier: TopRatedTableviewCell.Identifier)
        tableView.rowHeight = rowHeight
    }
}

//MARK: - TableView DataSource
extension TopRatedListViewController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.datasource.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopRatedTableviewCell.Identifier,
                                                 for: indexPath) as! TopRatedTableviewCell
        cell.configureCell(viewModel.datasource[indexPath.row])
        return cell
    }
}

//MARK: - ViewModel Chages
private extension TopRatedListViewController {
    func viewModelDidChange() {
        cancellable = viewModel
            .$title
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] title in
            self?.title = title
        }

        cancellable = viewModel
            .$datasource
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
}

//MARK: - Alert View
private extension TopRatedListViewController {
    func showAlert() {
        let message = viewModel.errorMessage
        let alertViewController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        self.present(alertViewController, animated: true)
    }
}
