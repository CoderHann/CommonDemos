//
//  SnapKitViewController.swift
//  SnapKitAndVFL
//
//  Created by roki on 2017/8/18.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit

class SnapKitViewController: UIViewController {
    
    // subviews
    var whiteView: UIView?;
    
    // whiteSubviews
    var iconBtn: UIButton?;
    var nameLabel: UILabel?;
    
    var timeLabel: UILabel?;
    var sourceLabel: UILabel?;
    var arrowBtn: UIButton?;
    
    var firstLabel: UILabel?;
    var secondLabel: UILabel?;
    var imagesView: UIView?;
    var actionView: UIView?;
    
    // imagesSubviews
    var imageOne: UIImageView?;
    var imageTwo: UIImageView?;
    var imageThree: UIImageView?;
    
    // actionSubviews
    var btnOne: UIButton?;
    var btnTwo: UIButton?;
    var btnThree: UIButton?;


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "SnapKit";
        self.view.backgroundColor = UIColor.white;
        
        //init
        self.setup();
        //layout VFL
        self.layoutWhiteView();
        self.layout();

        
        self.layoutImagesView();
        self.layoutActioinView();
    }

    func setup() {
    

        self.view.backgroundColor = UIColor.gray;
    
        whiteView = UIView.init();
        whiteView?.backgroundColor = UIColor.white;
        self.view.addSubview(whiteView!);
    
    //
        iconBtn = UIButton.init();
        iconBtn?.backgroundColor = UIColor.orange;
        iconBtn?.layer.cornerRadius = 6;
        iconBtn?.clipsToBounds = true;
        whiteView?.addSubview(iconBtn!);
    
        nameLabel = UILabel.init();
        nameLabel?.backgroundColor = UIColor.green;
        whiteView?.addSubview(nameLabel!);
    
        timeLabel = UILabel.init();
        timeLabel?.backgroundColor = UIColor.gray;
        whiteView?.addSubview(timeLabel!);
    
        sourceLabel = UILabel.init();
        sourceLabel?.backgroundColor = UIColor.gray;
        whiteView?.addSubview(sourceLabel!);
    
    
        arrowBtn = UIButton.init();
        arrowBtn?.backgroundColor = UIColor.brown;
        whiteView?.addSubview(arrowBtn!);
    
        firstLabel = UILabel.init();
        firstLabel?.backgroundColor = UIColor.lightGray;
        firstLabel?.numberOfLines = 0;
        firstLabel?.text = "12345678901234567890qwertyuiopasdfghjklzxcvbnm,";
        whiteView?.addSubview(firstLabel!);
    
        secondLabel = UILabel.init();
        secondLabel?.backgroundColor = UIColor.lightGray;
        secondLabel?.numberOfLines = 0;
        secondLabel?.text = "fsjfkl4563uedkfvgyefhjnvfm,egyfdhjnkm,dshunkfmd,eydjm,edcujmedjm";
        whiteView?.addSubview(secondLabel!);
    
    
        imagesView = UIView.init();
        imagesView?.backgroundColor = UIColor.purple;
        whiteView?.addSubview(imagesView!);
        
        actionView = UIView.init();
        actionView?.backgroundColor = UIColor.gray;
        whiteView?.addSubview(actionView!);
        
        //images
        imageOne = UIImageView.init();
        imageOne?.backgroundColor = UIColor.orange;
        imageOne?.layer.cornerRadius = 3;
        imageOne?.clipsToBounds = true;
        imagesView?.addSubview(imageOne!);
        
        imageTwo = UIImageView.init();
        imageTwo?.backgroundColor = UIColor.orange;
        imageTwo?.layer.cornerRadius = 3;
        imageTwo?.clipsToBounds = true;
        imagesView?.addSubview(imageTwo!);
        
        imageThree = UIImageView.init();
        imageThree?.backgroundColor = UIColor.orange;
        imageThree?.layer.cornerRadius = 3;
        imageThree?.clipsToBounds = true;
        imagesView?.addSubview(imageThree!);
    
        //actionView
        btnOne = UIButton.init();
        btnOne?.backgroundColor = UIColor.blue;
        btnOne?.alpha = 0.4;
        actionView?.addSubview(btnOne!);

        btnTwo = UIButton.init();
        btnTwo?.backgroundColor = UIColor.blue;
        btnTwo?.alpha = 0.4;
        actionView?.addSubview(btnTwo!);
    
    
        btnThree = UIButton.init();
        btnThree?.backgroundColor = UIColor.blue;
        btnThree?.alpha = 0.4;
        actionView?.addSubview(btnThree!);
        
    }


    func layout() {
        
        
        whiteView?.snp.makeConstraints({ (maker) in
            maker.left.equalTo(10);
            maker.right.equalTo(-10);
            maker.top.equalTo(20);
        });
    }
    
    func layoutWhiteView() {
        
        
        iconBtn?.snp.makeConstraints({ (maker) in
           
            maker.width.height.equalTo(50);
            maker.top.left.equalTo(10);
            
        });
        nameLabel?.snp.makeConstraints({ (maker) in
            maker.height.equalTo(25);
            maker.width.equalTo(200);
            maker.top.equalTo(10);
            maker.left.equalTo((iconBtn?.snp.right)!).offset(5);
        });
        
        timeLabel?.snp.makeConstraints({ (maker) in
            maker.width.equalTo(60);
            maker.height.equalTo(20);
            maker.left.equalTo((nameLabel?.snp.left)!);
            maker.bottom.equalTo((iconBtn?.snp.bottom)!);
            
        })
        
        sourceLabel?.snp.makeConstraints({ (maker) in
            maker.width.equalTo(100);
            maker.height.equalTo(20);
            maker.top.equalTo((timeLabel?.snp.top)!);
            maker.left.equalTo((timeLabel?.snp.right)!).offset(5);
            
        });
        
        arrowBtn?.snp.makeConstraints({ (maker) in
            maker.width.height.equalTo(20);
            maker.top.equalTo((nameLabel?.snp.top)!);
            maker.right.equalTo(-10);
        })
        
        firstLabel?.snp.makeConstraints({ (maker) in
            maker.left.equalTo(10);
            maker.right.equalTo(-10);
            maker.top.equalTo((iconBtn?.snp.bottom)!).offset(10);
        })
        
        secondLabel?.snp.makeConstraints({ (maker) in
            maker.left.equalTo(10);
            maker.right.equalTo(-10);
            maker.top.equalTo((firstLabel?.snp.bottom)!).offset(10);
        })
        
        imagesView?.snp.makeConstraints({ (maker) in
            maker.left.equalTo(10);
            maker.right.equalTo(-10);
            maker.height.equalTo(150);
            maker.top.equalTo((secondLabel?.snp.bottom)!).offset(5);
        })
        actionView?.snp.makeConstraints({ (maker) in
            maker.left.equalTo(10);
            maker.right.equalTo(-10);
            maker.height.equalTo(35);
            maker.top.equalTo((imagesView?.snp.bottom)!).offset(5);
            maker.bottom.equalTo((whiteView?.snp.bottom)!).offset(-10);
            
        })
        
    }
    func layoutImagesView() {
        
        imageOne?.snp.makeConstraints({ (maker) in
            maker.left.equalTo(10);
            maker.top.equalTo(20);
            maker.bottom.equalTo(-20);
            maker.width.greaterThanOrEqualTo(0);
        })
        
        imageTwo?.snp.makeConstraints({ (maker) in
            maker.top.bottom.width.equalTo(imageOne!);
            maker.left.equalTo((imageOne?.snp.right)!).offset(5);
            
        })
        
        imageThree?.snp.makeConstraints({ (maker) in
            maker.top.bottom.width.equalTo(imageOne!);
            maker.left.equalTo((imageTwo?.snp.right)!).offset(5);
            maker.right.equalTo(-10);
        })
        
    }
    func layoutActioinView() {
        
        btnOne?.snp.makeConstraints({ (maker) in
            maker.left.top.bottom.equalTo(0);
            maker.width.greaterThanOrEqualTo(0);
            
        })
        btnTwo?.snp.makeConstraints({ (maker) in
            maker.top.bottom.width.equalTo(btnOne!);
            maker.left.equalTo((btnOne?.snp.right)!).offset(1);
            
        })
        
        btnThree?.snp.makeConstraints({ (maker) in
            maker.top.bottom.width.equalTo(btnOne!);
            maker.left.equalTo((btnTwo?.snp.right)!).offset(1);
            maker.right.equalTo(0);
        })
//        btnOne?.translatesAutoresizingMaskIntoConstraints = false;
//        btnTwo?.translatesAutoresizingMaskIntoConstraints = false;
//        btnThree?.translatesAutoresizingMaskIntoConstraints = false;
//        
//        let views: [String: Any] = ["btnOne": btnOne!,"btnTwo": btnTwo!,"btnThree": btnThree!];
//        
//        let metrics: [String: Any] = ["marginH": 0, "padding": 1];
//        
//        var constraints: [NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: "H:|-marginH-[btnOne]-padding-[btnTwo]-padding-[btnThree]-marginH-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views);
//        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[btnThree]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
//        constraints.append(NSLayoutConstraint.init(item: btnTwo!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0.0))
//        constraints.append(NSLayoutConstraint.init(item: btnThree!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0.0))
//        
//        
//        constraints.append(NSLayoutConstraint.init(item: btnTwo!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0.0))
//        
//        constraints.append(NSLayoutConstraint.init(item: btnThree!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0.0))
//        
//        
//        constraints.append(NSLayoutConstraint.init(item: btnTwo!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0))
//        constraints.append(NSLayoutConstraint.init(item: btnThree!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0))
//            actionView?.addConstraints(constraints);
        
            
            
            
            }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        firstLabel?.text = firstLabel?.text?.appending("goodBoy");
        secondLabel?.text = secondLabel?.text?.appending("goodGirl");
        
    }

}
    
