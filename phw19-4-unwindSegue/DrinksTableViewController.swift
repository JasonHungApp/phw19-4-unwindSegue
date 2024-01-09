//
//  DrinksTableViewController.swift
//  phw19-4-unwindSegue
//
//  Created by jasonhung on 2024/1/9.
//

import UIKit

class DrinksTableViewController: UITableViewController {

    // 完整的台灣縣市列表
        let drinks = ["茉莉綠茶", "阿薩姆紅茶", "四季春青茶", "黃金烏龍", "檸檬綠", "梅の綠", "桔子綠", "8冰綠", "養樂多綠", "冰淇淋紅茶", "旺來紅(季節限定)", "柚子紅", "鮮柚綠"]

        var selectedValue: String?

        override func viewDidLoad() {
            super.viewDidLoad()
            //tableView.backgroundColor = UIColor.lightGray
        }

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return drinks.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "drinksCell", for: indexPath)
            cell.textLabel?.text = drinks[indexPath.row]
            // 使用UIFont來設定字型
            if let customFont = UIFont(name: "WD-XLLubrifontTC-Regular", size: 20.0) {
                cell.textLabel?.font = customFont
            }
            return cell
        }

        // MARK: - Table view delegate

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedValue = drinks[indexPath.row]
           // performSegue(withIdentifier: "unwindToFirstViewController", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let cell = sender as? UITableViewCell,
          let indexPath = tableView.indexPath(for: cell) {
           selectedValue = drinks[indexPath.row]
       }
    }

}
