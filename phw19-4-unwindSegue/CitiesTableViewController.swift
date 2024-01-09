//
//  BTableViewController.swift
//  phw19-4-unwindSegue
//
//  Created by jasonhung on 2024/1/9.
//

import UIKit

class CitiesTableViewController: UITableViewController {

    // 完整的台灣縣市列表
        let cities = ["台北市", "新北市", "桃園市", "台中市", "台南市", "高雄市", "基隆市", "新竹市", "新竹縣", "苗栗縣", "彰化縣", "南投縣", "雲林縣", "嘉義市", "嘉義縣", "屏東縣", "宜蘭縣", "花蓮縣", "台東縣", "澎湖縣", "金門縣", "連江縣"]

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
            return cities.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
            cell.textLabel?.text = cities[indexPath.row]
            // 使用UIFont來設定字型
            if let customFont = UIFont(name: "WD-XLLubrifontTC-Regular", size: 20.0) {
                cell.textLabel?.font = customFont
            }
            return cell
        }

        // MARK: - Table view delegate

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedValue = cities[indexPath.row]
           // performSegue(withIdentifier: "unwindToFirstViewController", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let cell = sender as? UITableViewCell,
          let indexPath = tableView.indexPath(for: cell) {
           selectedValue = cities[indexPath.row]
       }
    }

}
