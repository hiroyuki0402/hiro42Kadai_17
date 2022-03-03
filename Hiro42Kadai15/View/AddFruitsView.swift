//
//  AddFruitsView.swift
//  Hiro42Kadai15
//
//  Created by SHIRAISHI HIROYUKI on 2022/02/14.
//

import Foundation
import UIKit

class AddFruitsView: UIView {
    fileprivate var fruitsDataSource: FruitsDataSource!
    fileprivate var fruitsField: UITextField!
    fileprivate var fruitsName: String!
    weak var delegate: AddFruitsViewDelegate?
    private var mode: Mode!
    private var selectedIndex: Int!

    required override init(frame: CGRect) {
        super.init(frame: frame)
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
}

extension AddFruitsView: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if textField.isSelected {
        delegate?.createView(Editting: self, fruitsName: .init(name: fruitsField?.text ?? "", isChecked: false))
        }
        return true
    }
}
extension AddFruitsView: FruitDataProtocol {
    func editData(dataSours: FruitsDataSource, mode: Mode, at selectedIndex: Int) {
        if mode == .update {
            self.fruitsName = fruitsDataSource.fruitsData(at: selectedIndex)?.name
        }
    }


}

protocol AddFruitsViewDelegate: AnyObject {
    func createView(Editting view: AddFruitsView, fruitsName: FruitItem)
}
enum Mode {
    case create
    case update
}
