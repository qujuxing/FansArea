//
//  AreaTableViewController.swift
//  FansArea
//
//  Created by 瞿炬星 on 2018/3/8.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {
    
    
    
    var areas = [
        "闵行区莘庄镇","兰州七里河区","三明市尤溪县","西宁城西区","广州白云区","闽侯县上街镇","哈尔滨市南岗区","临汾市尧都区","成都武侯区","汕头市金平区","长沙市芙蓉区"
    ]
    var areaImages = [ "xinzhuang","qilihe","youxi","chengxi","baiyun","shangjie","nangang","yaodu","wuhou","jinping","furong"
    ]
    var provinces = [
    "上海","甘肃","福建","青海","广东","福建","黑龙江","山西","四川","广东","湖南"
    ]
    var parts = [
    "华东","西北","东南","西北","华南","东南","东北","华北","西南","华南","华中"
    ]

    var visited = [Bool](repeatElement(false, count: 11))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:  - Table View delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = UIAlertController(title: "朋友你好", message: "您选择了第\(indexPath.row)行", preferredStyle: .actionSheet)
        
        let optionCacel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        let option3 = UIAlertAction(title: "我去过", style: .default) { (_) in
           let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.visited[indexPath.row] = true
        }
        
        let option4 = UIAlertAction(title: "我没去过", style: .default) { (_) in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .none
            self.visited[indexPath.row] = false
        }
        menu.addAction(optionCacel)
        if self.visited[indexPath.row] == false {
            menu.addAction(option3)
        } else {
            menu.addAction(option4)
        }
        
        
        self.present(menu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return areas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        cell.nameLabel.text = areas[indexPath.row]
        cell.provinceLabel.text = provinces[indexPath.row]
        cell.partLabel.text = parts[indexPath.row]
        cell.thumbImageView.image = UIImage(named: areaImages[indexPath.row])
        cell.thumbImageView.layer.cornerRadius = 10
        
        cell.accessoryType = visited[indexPath.row] ? .checkmark : .none

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
