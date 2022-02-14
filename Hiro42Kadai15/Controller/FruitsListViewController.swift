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

        // Do any additional setup after loading the view.
    }
}

extension FruitsListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsDataSource.count()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FruitCell
        guard let fruitData = fruitsDataSource.fruitsData(at: indexPath.row) else { fatalError("") }
        cell.configure(item: fruitData)
        return cell
    }


}
