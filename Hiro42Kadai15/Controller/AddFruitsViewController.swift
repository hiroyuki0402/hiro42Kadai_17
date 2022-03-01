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
        runBack()
    }

    @objc func saveBarbuttonTapped(sender: UIBarButtonItem ) {
        guard let fruitsName = self.fruitsName else { return }
            dataSource.save(checkItem: .init(name: fruitsName, isChecked: true))
            runBack()
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

    func loadData(at index: Int) -> String {
        return FruitsDataSource().loadData()[index].name
    }
}
extension AddFruitsViewController2: AddFruitsViewDelegate {
    func createView(fruitsName: String) {
        self.fruitsName = fruitsName
    }
}
