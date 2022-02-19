//
//  AddFruitsView.swift
//  Hiro42Kadai15
//
//  Created by SHIRAISHI HIROYUKI on 2022/02/14.
//

import Foundation
import UIKit

class AddFruitsView: UIView {
    private var fruitsField: UITextField!
    weak var delegate: AddFruitsViewDelegate?

    required override init(frame: CGRect) {
        super.init(frame: frame)
        fruitsField = UITextField()
        fruitsField?.delegate = self
        fruitsField.backgroundColor = .white
        addSubview(fruitsField)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        fruitsField?.frame = CGRect(x: bounds.origin.x + 30,
                                    y: bounds.origin.y + 30,
                                    width: bounds.size.width - 40,
                                    height: 50)
    }
}

extension AddFruitsView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        delegate?.createView(fruitsAdd: self, fruitsName: fruitsField?.text ?? "")
        return true
    }
}

protocol AddFruitsViewDelegate: AnyObject {
    func createView(fruitsAdd view: AddFruitsView, fruitsName: String)
//    func createView(saveDidtap view: AddFruitsView)
//    func createView(backDidtap view: AddFruitsView)
}
