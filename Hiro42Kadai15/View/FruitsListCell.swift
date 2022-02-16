//
//  FruitsListCell.swift
//  Hiro42Kadai15
//
//  Created by SHIRAISHI HIROYUKI on 2022/02/14.
//

import Foundation
import UIKit

class FruitsListCell: UITableViewCell {
   private var checkImgaeView: UIImageView!
   private var fruitsNameLabel: UILabel!

    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        checkImgaeView.frame = CGRect(x: 10,
                                      y: 10,
                                      width: 50,
                                      height: 50)
        fruitsNameLabel.frame = CGRect(x: checkImgaeView.frame.origin.x + 10,
                                       y: self.frame.size.height / 2,
                                       width: contentView.frame.width - (checkImgaeView.frame.size.width + 20),
                                       height: checkImgaeView.frame.maxY - 20)
    }

    func configure(item: CheckItem) {
        fruitsNameLabel.text = item.name
        checkImgaeView.image = item.isChecked ? UIImage(named: "") : nil
    }

}
