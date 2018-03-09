//
//  AreaDetailViewController.swift
//  FansArea
//
//  Created by 瞿炬星 on 2018/3/9.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

import UIKit

class AreaDetailViewController: UIViewController {
    var areaName = ""

    @IBOutlet weak var areaImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        areaImageView.image = UIImage(named: areaName)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
