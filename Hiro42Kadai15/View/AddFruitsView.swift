//
//  AddFruitsView.swift
//  Hiro42Kadai15
//
//  Created by SHIRAISHI HIROYUKI on 2022/02/14.
//

import Foundation
import UIKit

class AddFruitsView: UIView {
    fileprivate var fruitsDataSource: FruitsDataSource?
    fileprivate var fruitsField: UITextField!
    fileprivate var fruitsName: String!
    weak var delegate: AddFruitsViewDelegate?

    required override init(frame: CGRect) {
        super.init(frame: frame)
        fruitsName = FruitsDataSource().loadData()[insertDstination].name
        fruitsField = UITextField()
        fruitsField?.delegate = self
        fruitsField.borderStyle = .roundedRect
        fruitsField.backgroundColor = .lightGray
        fruitsField.text = fruitsName ?? ""
        fruitsField.textColor = .white
        addSubview(fruitsField)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        fruitsField?.frame = CGRect(x: 20,
                                    y: bounds.origin.y + 30,
                                    width: bounds.size.width - 40,
                                    height: 50)
    }
    func insertDstination(index: Int) -> Int {
        return index
    }
}

extension AddFruitsView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        delegate?.createView(fruitsName: .init(name: fruitsField?.text ?? "", isChecked: false))
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.createView(fruitsName: .init(name: fruitsField?.text ?? "", isChecked: false))
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.createView(fruitsName: .init(name: fruitsField?.text ?? "", isChecked: false))
    }
}

protocol AddFruitsViewDelegate: AnyObject {
    func createView(fruitsName: FruitItem)
}
enum Mode {
    case create
    case update
}
