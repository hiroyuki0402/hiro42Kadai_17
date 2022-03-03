//
//  FruitsDataSource.swift
//  Hiro42Kadai15
//
//  Created by SHIRAISHI HIROYUKI on 2022/02/14.
//

import Foundation

class FruitsDataSource {
    /// - NOTE: 一時的にstaticnにしているが後半でcoreData or User defaultに変更
    static private var checkItems = [FruitItem]()
    static private var mode: Mode!
    private var selectedIndex: Int!
    weak var delegate: FruitDataProtocol?

    /// セルの数
    /// - Returns: checkItemsの総数
    func count() -> Int {
        return FruitsDataSource.checkItems.count
    }

    /// セルの内容
    /// - Parameter indexPath: TableViewのIndexPath.row
    /// - Returns: 指定したindexに対応するフルーツを返却
    func fruitsData(at indexPath: Int) -> FruitItem? {
        if FruitsDataSource.checkItems.count > indexPath {
            return FruitsDataSource.checkItems[indexPath]
        }
        return nil
    }

    /// データの保存
    /// - Parameter checkItem: FruitItem
    func save(checkItem: FruitItem) {
        FruitsDataSource.checkItems.append(checkItem)
    }

    /// - NOTE: coreData or User defaultに変更した際にロジック変更予定
    func loadData() -> [FruitItem] {
        return FruitsDataSource.checkItems
    }

    /// FruitsListViewControllerの初期表示値
    func initializeFruitsInStock() {
        FruitsDataSource.checkItems = [
            .init(name: "りんご", isChecked: false),
            .init(name: "みかん", isChecked: true),
            .init(name: "バナナ", isChecked: false),
            .init(name: "パイナップル", isChecked: true)
        ]
    }

    /// 選んだセルのBool値の反転
    /// - Parameter indexPath: 指定したindex
    func toggle(at indexPath: Int) {
        FruitsDataSource.checkItems[indexPath].isChecked.toggle()
    }

    func update(at index: Int, fruitName: FruitItem) {
        FruitsDataSource.checkItems[index] = fruitName
    }

    func selectedAtIndex(at index: Int, mode: Mode) {
        //FruitsDataSource.mode = mode
        delegate?.editData(dataSours: self, mode: .update, at: index)
    }
    func giveIndex() -> Int {
        return selectedIndex
    }
}

protocol FruitDataProtocol: AnyObject {
    func editData(dataSours: FruitsDataSource, mode: Mode , at selectedIndex: Int)
}
class FruitItem {
    var name: String
    var isChecked: Bool

    init(name: String, isChecked: Bool) {
        self.name = name
        self.isChecked = isChecked
    }
}
