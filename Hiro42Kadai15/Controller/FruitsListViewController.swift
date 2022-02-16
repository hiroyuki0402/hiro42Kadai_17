//
//  FruitsListViewController.swift
//  Hiro42Kadai15
//
//  Created by SHIRAISHI HIROYUKI on 2022/02/14.
//

import UIKit

class FruitsListViewController: UIViewController {
    private var fruitsDataSource: FruitsDataSource!
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fruitsDataSource = FruitsDataSource()
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.backgroundColor = .brown
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FruitsListCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)

        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                            target: self,
                                            action: #selector(barButtonTapped(sender:)))
        navigationItem.rightBarButtonItem = barButtonItem
        // Do any additional setup after loading the view.
        let datas: [CheckItem] = [CheckItem(name: "ss", isChecked: true),
                                 CheckItem(name: "ww", isChecked: true)]
        fruitsDataSource.firstView(checkItems: datas)

        print(fruitsDataSource.count())
    }
    @objc func barButtonTapped(sender: UIBarButtonItem) {
    }
}

extension FruitsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsDataSource.count()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? FruitCell

        guard let fruitData = fruitsDataSource.fruitsData(at: indexPath.row) else { fatalError("") }
        cell?.configure(item: fruitData)
        return cell ?? UITableViewCell()
    }
}
