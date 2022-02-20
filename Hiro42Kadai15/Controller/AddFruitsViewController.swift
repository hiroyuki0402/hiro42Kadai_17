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
    private var mode: Mode!
    private var didTapCancel: () -> Void = {}
    private var didTapSave: (String) -> Void = { _ in }
    private var backButton: UIBarButtonItem!
    private var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addFruitsView = AddFruitsView()
        addFruitsView.delegate = self
        view.addSubview(addFruitsView)

        backButton = UIBarButtonItem(title: "Back",
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapButon(sender:)))

        saveButton = UIBarButtonItem(title: "Save",
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapButon(sender:)))

        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = saveButton
        dataSource = FruitsDataSource()

        // Do any additional setup after loading the view.
    }
    @objc func didTapButon(sender: UIBarButtonItem ) {
        guard let fruitsName = self.fruitsName else { return }
        print(sender)
        switch sender.title {
        case "Save":
            dataSource.save(checkItem: .init(name: fruitsName, isChecked: true))
//            dismiss(animated: true, completion: nil)
//            navigationController?.popViewController(animated: true)
//            print("save")
            dismiss(animated: true, completion: nil)
////            dataSource.save(checkItem: .init(name: fruitsName, isChecked: true))
//            dataSource.firstView(checkItems: [.init(name: fruitsName, isChecked: true)])

        case "Back":
//            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
//            print("back")
//            navigationController.po
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

//    func setup(mode: Mode, didTapSave: @escaping (String) -> Void, didTapCancel: @escaping () -> Void) {
//        self.mode = mode
//        self.didTapSave = didTapSave
//        self.didTapCancel = didTapCancel
//    }
}

extension AddFruitsViewController2: AddFruitsViewDelegate {
    func createView(fruitsAdd view: AddFruitsView, fruitsName: String) {
        self.fruitsName = fruitsName
    }

    func createView(saveDidtap view: AddFruitsView) {
//        view.
    }
//    func createView(backDidtap view: AddFruitsView) {
//        print("")
//    }
}
