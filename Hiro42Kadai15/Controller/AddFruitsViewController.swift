//
//  AddFruitsViewController.swift
//  Hiro42Kadai15
//
//  Created by SHIRAISHI HIROYUKI on 2022/02/15.
//

import UIKit

class AddFruitsViewController2: UIViewController {
    fileprivate var addFruitsView: AddFruitsView!
    fileprivate var dataSource: FruitsDataSource!
    fileprivate var fruitsName: String?
    private var runBack: () -> Void = {}


    private lazy var backButton: UIBarButtonItem = {
        var backButton = UIBarButtonItem()
        backButton = UIBarButtonItem(title: "Back",
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapButon(sender:)))
        return backButton
    }()
    private lazy var saveButton: UIBarButtonItem = {
        var saveButton = UIBarButtonItem()
        saveButton = UIBarButtonItem(title: "Save",
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapButon(sender:)))
        return saveButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addFruitsView = AddFruitsView()
        addFruitsView.delegate = self
        view.addSubview(addFruitsView)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = saveButton
        dataSource = FruitsDataSource()
    }

    @objc func didTapButon(sender: UIBarButtonItem ) {
        guard let fruitsName = self.fruitsName else { return }
        switch sender.title {
        case "Save":
            dataSource.save(checkItem: .init(name: fruitsName, isChecked: true))
            runBack()
        case "Back":
            runBack()
        default: break
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        addFruitsView.frame = CGRect(x: view.safeAreaInsets.left,
                                     y: view.safeAreaInsets.top,
                                     width: view.frame.size.width - view.safeAreaInsets.left -
                                     view.safeAreaInsets.right,
                                     height: view.frame.size.height - view.safeAreaInsets.bottom)
    }
    func setup(runBack: @escaping () -> Void) {
        self.runBack = runBack
    }
    func load(load: FruitItem) {
        self.fruitsName = load.name
    }
}
extension AddFruitsViewController2: AddFruitsViewDelegate {
    func createView(fruitsName: String) {
        self.fruitsName = fruitsName
    }
}
