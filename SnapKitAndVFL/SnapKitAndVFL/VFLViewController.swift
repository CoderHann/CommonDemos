//
//  VFLViewController.swift
//  SnapKitAndVFL
//
//  Created by roki on 2017/8/20.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit

class VFLViewController: UIViewController {

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
        self.layout();
        
        self.layoutWhiteView();
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
        
        
        whiteView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let views: [String: Any] = ["whiteView": whiteView!];
        let metrics: [String: Any] = ["marginV": 10, "marginH": 10];
        
        var constraints: [NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[whiteView]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views);
        
        
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-marginH-[whiteView]-marginH-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views));
        
        self.view.addConstraints(constraints);
    }
    
    func layoutWhiteView() {
        // forbid autoresizing
        iconBtn?.translatesAutoresizingMaskIntoConstraints = false;
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false;
        timeLabel?.translatesAutoresizingMaskIntoConstraints = false;
        sourceLabel?.translatesAutoresizingMaskIntoConstraints = false;
        arrowBtn?.translatesAutoresizingMaskIntoConstraints = false;
        firstLabel?.translatesAutoresizingMaskIntoConstraints = false;
        secondLabel?.translatesAutoresizingMaskIntoConstraints = false;
        imagesView?.translatesAutoresizingMaskIntoConstraints = false;
        actionView?.translatesAutoresizingMaskIntoConstraints = false;
        
        let views: [String: Any] = ["iconBtn": iconBtn!,"nameLabel": nameLabel!,"timeLabel": timeLabel!,"sourceLabel": sourceLabel!,"arrowBtn": arrowBtn!,"firstLabel": firstLabel!,"secondLabel": secondLabel!,"imagesView": imagesView!,"actionView": actionView!];
        let metrics: [String: Any] = ["marginH": 10, "marginV": 10, "paddingT1": 5, "paddingT2": 10,"iconEdge": 50, "imageV": 150, "actionV": 35];
        
        var constraints: [NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: "V:|-marginV-[iconBtn(iconEdge)]-paddingT2-[firstLabel]-paddingT2-[secondLabel]-paddingT1-[imagesView(imageV)]-paddingT1-[actionView(actionV)]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views);
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-marginV-[nameLabel(25)]->=0-[timeLabel(20)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views));
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[nameLabel]->=0-[sourceLabel(20)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views));
        
        
        constraints.append(NSLayoutConstraint.init(item: timeLabel!, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: iconBtn!, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0.0));
        constraints.append(NSLayoutConstraint.init(item: sourceLabel!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: timeLabel!, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0))
        constraints.append(NSLayoutConstraint.init(item: arrowBtn!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: nameLabel!, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0))
        constraints.append(NSLayoutConstraint.init(item: arrowBtn!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: arrowBtn!, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0.0))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-marginH-[iconBtn(iconEdge)]-paddingT1-[nameLabel(200)]->=0-[arrowBtn(20)]-marginH-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views));
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[iconBtn]-paddingT1-[timeLabel(60)]-paddingT1-[sourceLabel(100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views));
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:"H:|-marginH-[firstLabel]-marginH-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views));
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:"H:|-marginH-[secondLabel]-marginH-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views));
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:"H:|-marginH-[imagesView]-marginH-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views));
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:"H:|-marginH-[actionView]-marginH-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views));
        
        whiteView?.addConstraints(constraints);
        
    }
    func layoutImagesView() {
        imageOne?.translatesAutoresizingMaskIntoConstraints = false;
        imageTwo?.translatesAutoresizingMaskIntoConstraints = false;
        imageThree?.translatesAutoresizingMaskIntoConstraints = false;
        
        let views: [String: Any] = ["imageOne": imageOne!,"imageTwo": imageTwo!,"imageThree": imageThree!];
        
        let metrics: [String: Any] = ["marginH": 10, "marginV": 20, "padding": 5];
        
        var constraints: [NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: "H:|-marginH-[imageOne]-padding-[imageTwo]-padding-[imageThree]-marginH-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views);
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat:"V:|-marginV-[imageOne]-marginV-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
        
        constraints.append(NSLayoutConstraint.init(item: imageTwo!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: imageOne!, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0.0))
        
        constraints.append(NSLayoutConstraint.init(item: imageTwo!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: imageOne!, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0.0))
        
        constraints.append(NSLayoutConstraint.init(item: imageTwo!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: imageOne!, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0))
        
        constraints.append(NSLayoutConstraint.init(item: imageThree!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: imageOne!, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0.0))
        
        constraints.append(NSLayoutConstraint.init(item: imageThree!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: imageOne!, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0.0))
        constraints.append(NSLayoutConstraint.init(item: imageThree!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: imageOne!, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0))
        
        
        imagesView?.addConstraints(constraints);
        
        
        
    }
    func layoutActioinView() {
        btnOne?.translatesAutoresizingMaskIntoConstraints = false;
        btnTwo?.translatesAutoresizingMaskIntoConstraints = false;
        btnThree?.translatesAutoresizingMaskIntoConstraints = false;
        
        let views: [String: Any] = ["btnOne": btnOne!,"btnTwo": btnTwo!,"btnThree": btnThree!];
        
        let metrics: [String: Any] = ["marginH": 0, "padding": 1];
        
        var constraints: [NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: "H:|-marginH-[btnOne]-padding-[btnTwo]-padding-[btnThree]-marginH-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views);
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[btnThree]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
        constraints.append(NSLayoutConstraint.init(item: btnTwo!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0.0))
        constraints.append(NSLayoutConstraint.init(item: btnThree!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0.0))
        
        
        constraints.append(NSLayoutConstraint.init(item: btnTwo!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0.0))
        
        constraints.append(NSLayoutConstraint.init(item: btnThree!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0.0))
        
        
        constraints.append(NSLayoutConstraint.init(item: btnTwo!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0))
        constraints.append(NSLayoutConstraint.init(item: btnThree!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: btnOne!, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0))
        actionView?.addConstraints(constraints);
        
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        firstLabel?.text = firstLabel?.text?.appending("goodBoy");
        secondLabel?.text = secondLabel?.text?.appending("goodGirl");
        
    }

}
