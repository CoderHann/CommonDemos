//
//  ViewController.swift
//  SnapKitAndVFL
//
//  Created by roki on 2017/8/18.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell? = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "ViewControllerCellID");
        
        if indexPath.row == 0 {
            cell?.textLabel?.text = "VFL";
        } else {
            cell?.textLabel?.text = "SnapKit";
        }
        
        return cell!;
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // 跳到VFL
            let vfl = VFLViewController.init();
            self.navigationController?.pushViewController(vfl, animated: true);
        } else {
            // 跳SnapKit
            let snapkit = SnapKitViewController.init();
            self.navigationController?.pushViewController(snapkit, animated: true);
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2;
    }
    
    
    
    
    


}

