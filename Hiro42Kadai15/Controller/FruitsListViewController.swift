//
//  FruitsListViewController.swift
//  Hiro42Kadai15
//
//  Created by SHIRAISHI HIROYUKI on 2022/02/14.
//

import UIKit

class FruitsListViewController: UIViewController {
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.rowHeight = 70
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FruitsListCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        return tableView
    }()

    private lazy var barButtonItem: UIBarButtonItem = {
        var barButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                            target: self,
                                            action: #selector(barButtonTapped(sender:)))
        return barButtonItem
    }()

    private var fruitsDataSource: FruitsDataSource!
    private var fruitsNames: [FruitItem]!

    override func viewDidLoad() {
        super.viewDidLoad()
        fruitsDataSource = FruitsDataSource()
        fruitsDataSource.initializeFruitsInStock()
        navigationItem.rightBarButtonItem = barButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fruitsNames = fruitsDataSource.loadData()
        tableView.reloadData()
    }

    /// 果物の追加
    /// - Parameter sender: barButtonItem - #selector
    @objc func barButtonTapped(sender: UIBarButtonItem) {
        let controller = AddFruitsViewController2()
        let navi = UINavigationController(rootViewController: controller)
        navi.modalPresentationStyle = .fullScreen
        present(navi, animated: true, completion: nil)
    }
}

extension FruitsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsDataSource.count()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FruitsListCell
        guard let fruitData = fruitsDataSource.fruitsData(at: indexPath.row) else { fatalError("") }
        cell.configure(item: fruitData)
        cell.accessoryType = .detailButton
        return cell
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        fruitsDataSource.toggle(at: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
}
