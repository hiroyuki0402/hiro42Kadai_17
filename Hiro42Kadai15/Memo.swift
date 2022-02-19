//
//  Memo.swift
//  Hiro42Kadai15
//
//  Created by 白石裕幸 on 2021/12/06.
//

import Foundation
import Metal
import UIKit

// 1:テーブルビューにチェックマークを表示
// ・今回はみかんバナナに表示
// 2:addを押すと入力画面へ遷移
// 3:入力画面でTextFieldへ入力可能
// 4:アクションを押すと保存・キャンセルができる
// 5:入力したものがテーブルビューに表示される
// 6: セルをタップするとチェックマークの表示が変化する 【2021/12/14 new】
//  ・追加した値も変化する
//  ・※One of the two will be used. Which one is undefined.　が出る
// 7: セルの右端に丸いiを置く(accessoryType) 【2021/12/30 new】
// 8: 対象のセルのiを押すと入力画面に遷移しする
// 9: 押下した対象のセルの入力画面へ遷移したら対象のセルの値はテキストフィールドに反映されてる
// 10: ３から同じ動き

