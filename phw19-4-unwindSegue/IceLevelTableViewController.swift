//
//  IceLevelTableViewController.swift
//  phw19-4-unwindSegue
//
//  Created by jasonhung on 2024/1/9.
//

import UIKit

class IceLevelTableViewController: UITableViewController {

    // 完整的台灣縣市列表
        let iceLevel = ["正常冰", "少冰", "微冰", "去冰", "常溫", "溫", "熱"]

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
            return iceLevel.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "iceLevelCell", for: indexPath)
            cell.textLabel?.text = iceLevel[indexPath.row]
            // 使用UIFont來設定字型
            if let customFont = UIFont(name: "WD-XLLubrifontTC-Regular", size: 20.0) {
                cell.textLabel?.font = customFont
            }
            return cell
        }

        // MARK: - Table view delegate

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedValue = iceLevel[indexPath.row]
           // performSegue(withIdentifier: "unwindToFirstViewController", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let cell = sender as? UITableViewCell,
          let indexPath = tableView.indexPath(for: cell) {
           selectedValue = iceLevel[indexPath.row]
       }
    }

}
