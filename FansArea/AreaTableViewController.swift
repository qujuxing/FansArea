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
        Area(name: "闵行区莘庄镇莘凌路285弄绿梅二邨113", province: "上海", part: "华东", image: "xinzhuang", isVisited: false) ,
        Area(name: "兰州七里河区彭家坪路36号龚家湾", province: "甘肃", part: "西北", image: "qilihe", isVisited: false) ,
        Area(name: "三明市尤溪县西城镇溪树头小区2栋504", province: "福建", part: "东南", image: "youxi", isVisited: false) ,
        Area(name: "西宁城西区海湖新区文成路16号", province: "青海", part: "西北", image: "chengxi", isVisited: false) ,
        Area(name: "广州白云区机场路3-9号怡乐商业大厦", province: "广东", part: "华南", image: "baiyun", isVisited: false) ,
        Area(name: "闽侯县上街镇新峰阳光理想城香草天空", province: "福建", part: "东南", image: "shangjie", isVisited: false) ,
        Area(name: "哈尔滨市南岗区王岗镇哈尔滨大街855号中海雍景熙岸6A栋", province: "黑龙江", part: "东北", image: "nangang", isVisited: false) ,
        Area(name: "临汾市尧都区体育南街92号", province: "山西", part: "华北", image: "yaodu", isVisited: false) ,
        Area(name: "成都武侯区玉林南路15号", province: "四川", part: "西南", image: "wuhou", isVisited: false) ,
        Area(name: "汕头市金平区蓬洲学校路15号", province: "广东", part: "华南", image: "jinping", isVisited: false) ,
        Area(name: "长沙市芙蓉区马王堆万家丽大道北段569号", province: "湖南", part: "华中", image: "furong", isVisited: false)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:  - Table View delegate
    
    /*
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
    */
    

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let actionShare = UITableViewRowAction(style: .normal, title: "分享") { (_, indexPath) in
            let actionSheet = UIAlertController(title: "分享", message: nil, preferredStyle: .actionSheet)
            let option1 = UIAlertAction(title: "QQ", style: .default, handler: nil)
            let option2 = UIAlertAction(title: "微信", style: .default, handler: nil)
            let optionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            actionSheet.addAction(option1)
            actionSheet.addAction(option2)
            actionSheet.addAction(optionCancel)
            
            self.present(actionSheet, animated: true, completion: nil)
        }
        actionShare.backgroundColor = UIColor.orange
        
        let actionDel = UITableViewRowAction(style: .destructive, title: "删除") { (_, indexPath) in
            self.areas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let actionTop = UITableViewRowAction(style: .default, title: "置顶") { (_, _) in
            
        }
        actionTop.backgroundColor = UIColor(red: 245/255, green: 199/255, blue: 221/255, alpha: 1)
        
        return [actionShare,actionDel,actionTop]
    }
    
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return areas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        cell.nameLabel.text = areas[indexPath.row].name
        cell.provinceLabel.text = areas[indexPath.row].province
        cell.partLabel.text = areas[indexPath.row].part
        cell.thumbImageView.image = UIImage(named: areas[indexPath.row].image)
        cell.thumbImageView.layer.cornerRadius = 10
        
//        cell.accessoryType = areas[indexPath.row] ? .checkmark : .none

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
   /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          
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

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAreaDetail" {
            let dest = segue.destination as! DetailTableViewController
            dest.area = areas[tableView.indexPathForSelectedRow!.row]
        }
    }
    

}
