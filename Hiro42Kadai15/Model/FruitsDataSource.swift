//
//  FruitsDataSource.swift
//  Hiro42Kadai15
//
//  Created by SHIRAISHI HIROYUKI on 2022/02/14.
//

import Foundation

class FruitsDataSource {
    private var checkItems = [CheckItem]()

    /// セルの数
    /// - Returns: checkItemsの総数
    func count() -> Int {
        return checkItems.count
    }

    /// セルの内容
    /// - Parameter indexPath: TableViewのIndexPath.row
    /// - Returns: 指定したindexに対応するフルーツを返却
    func fruitsData(at indexPath: Int) -> CheckItem? {
        if checkItems.count > indexPath {
            return checkItems[indexPath]
        }
        return nil
    }

}
