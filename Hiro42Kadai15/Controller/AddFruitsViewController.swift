//
//  AddFruitsViewController.swift
//  Hiro42Kadai15
//
//  Created by SHIRAISHI HIROYUKI on 2022/02/15.
//

import UIKit

class AddFruitsViewController: UIViewController {
    fileprivate var addFruitsView: AddFruitsView!
    fileprivate var dataSource: FruitsDataSource!
    fileprivate var fruitsName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = FruitsDataSource()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        addFruitsView.frame = CGRect(x: view.safeAreaInsets.left,
                                     y: view.safeAreaInsets.top,
                                     width: view.frame.size.width - view.safeAreaInsets.left -
                                     view.safeAreaInsets.right,
                                     height: view.frame.size.height - view.safeAreaInsets.bottom)
    }
}

extension AddFruitsViewController: AddFruitsViewDelegate {
    func createView(fruitsAdd view: AddFruitsView, fruitsName: String) {
        self.fruitsName = fruitsName
    }

    func createView(saveDidtap view: AddFruitsView) {
        print("")
    }
    func createView(backDidtap view: AddFruitsView) {
        print("")
    }
}
