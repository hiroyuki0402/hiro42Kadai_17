//
//  FruitsDataSource.swift
//  Hiro42Kadai15
//
//  Created by SHIRAISHI HIROYUKI on 2022/02/14.
//

import Foundation

class FruitsDataSource {
    
    private var checkItems = [FruitItem]()

    /// セルの数
    /// - Returns: checkItemsの総数
    func count() -> Int {
        return checkItems.count
    }

    /// セルの内容
    /// - Parameter indexPath: TableViewのIndexPath.row
    /// - Returns: 指定したindexに対応するフルーツを返却
    func fruitsData(at indexPath: Int) -> FruitItem? {
        if checkItems.count > indexPath {
            return checkItems[indexPath]
        }
        return nil
    }
    func save(checkItem: FruitItem) {
        checkItems.append(checkItem)
    }
    func firstView(checkItems: [FruitItem]) {
        self.checkItems = checkItems
    }
}

class FruitItem {
    var name: String
    var isChecked: Bool

    init(name: String, isChecked: Bool) {
        self.name = name
        self.isChecked = isChecked
    }
}
