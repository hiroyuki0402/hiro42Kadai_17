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
    fileprivate var fruitsName: FruitItem?
    fileprivate var insertDstination: Int!
    private var mode: Mode!

    private lazy var backButton: UIBarButtonItem = {
        var backButton = UIBarButtonItem()
        backButton = UIBarButtonItem(title: "Back",
                                     style: .plain,
                                     target: self,
                                     action: #selector(cancelBarbuttonTapped(sender:)))
        return backButton
    }()
    private lazy var saveButton: UIBarButtonItem = {
        var saveButton = UIBarButtonItem()
        saveButton = UIBarButtonItem(title: "Save",
                                     style: .plain,
                                     target: self,
                                     action: #selector(saveBarbuttonTapped(sender:)))
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @objc func cancelBarbuttonTapped(sender: UIBarButtonItem ) {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    @objc func saveBarbuttonTapped(sender: UIBarButtonItem ) {
        guard let fruitsName = self.fruitsName else { return }
        switch mode {
        case .create:
            dataSource.save(checkItem: .init(name: fruitsName.name, isChecked: true))
        case .update:
            dataSource.update(at: insertDstination, fruitName: fruitsName)
        default: break
        }
        navigationController?.dismiss(animated: true, completion: nil)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        addFruitsView.frame = CGRect(x: view.safeAreaInsets.left,
                                     y: view.safeAreaInsets.top,
                                     width: view.frame.size.width - view.safeAreaInsets.left -
                                     view.safeAreaInsets.right,
                                     height: view.frame.size.height - view.safeAreaInsets.bottom)
    }
    func update(at insert: Int, mode: Mode) {
        self.mode = mode
        insertDstination = insert
    }

}
extension AddFruitsViewController2: AddFruitsViewDelegate {
    func createView(fruitsName: FruitItem) {
        self.fruitsName = fruitsName
    }
}

