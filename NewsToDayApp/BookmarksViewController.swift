//
//  BookmarksViewController.swift
//  NewsToDayApp
//
//  Created by Damir Zaripov on 08.05.2023.
//

import UIKit

class BookmarksViewControllerCell: UITableViewCell {
    let customTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(customTextLabel)

        NSLayoutConstraint.activate([
            customTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            customTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customTextLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BookmarkViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView()

    let data = [
        "First item",
        "Second item",
        "Third item"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(BookmarksViewControllerCell.self, forCellReuseIdentifier: "CustomTableViewCell")

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! BookmarksViewControllerCell
        cell.customTextLabel.text = data[indexPath.row]
        return cell
    }

    // MARK: - Table view delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Handle cell selection here
    }
}

