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

        checkImgaeView = UIImageView()
        fruitsNameLabel = UILabel()

        checkImgaeView.frame = CGRect(x: 20,
                                      y: contentView.frame.origin.y + 10,
                                      width: 50,
                                      height: 50)

        checkImgaeView.backgroundColor = .blue

        fruitsNameLabel.frame = CGRect(x: checkImgaeView.frame.size.width + 40,
                                       y: contentView.frame.origin.y + 25 ,
                                       width: contentView.frame.width - (checkImgaeView.frame.size.width + 20),
                                       height: 20)

        fruitsNameLabel.backgroundColor = .brown
        addSubview(checkImgaeView)
        addSubview(fruitsNameLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func configure(item: CheckItem) {
        fruitsNameLabel.text = item.name
        checkImgaeView.image = item.isChecked ? UIImage(named: "checkmark") : nil
    }
}
