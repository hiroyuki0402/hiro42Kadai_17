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
        tableView.rowHeight = 70
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
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    @objc func barButtonTapped(sender: UIBarButtonItem) {
        // タスク作成画面へ画面遷移
        let controller = AddFruitsViewController2()
        let navi = UINavigationController(rootViewController: controller)
        controller.setup(mode: .create) { _ in
//            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        } didTapCancel: {
//            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }

        navi.modalPresentationStyle = .fullScreen
//        controller.createView(backDidtap: <#T##AddFruitsView#>)
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
        print(indexPath.count)
        guard let fruitData = fruitsDataSource.fruitsData(at: indexPath.row) else { fatalError("") }
        cell.configure(item: fruitData)
        print(indexPath.count)
        return cell
    }
}
