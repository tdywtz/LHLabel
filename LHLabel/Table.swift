//
//  Table.swift
//  LHLabel
//
//  Created by bangong on 16/8/4.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit


class Table: UIViewController {
    var textLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()

        let label : LHLabel = LHLabel.init(frame: CGRectMake(10, 10, 80, 80))
        self.view.addSubview(label);
        label.text = "asdfgdsgdf/ndsgoflgjf"
        label.textColor = UIColor.redColor()

     //   UIBarButtonItem.init(image: nil, landscapeImagePhone: nil, style: .Plain, target: self, action: #selector(categoryRightBBClick))
        let _tableView  = UITableView.init(frame: self.view.frame, style: .Plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        self.view.addSubview(_tableView)

        let button = UIButton.init(type: .Custom);
        button.addTarget(self, action:"open", forControlEvents: .TouchUpInside)

        print(class_getName(Table.classForCoder()))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func categoryRightBBClick() {

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension Table : UITableViewDataSource, UITableViewDelegate{

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        return Cell.init(style: .Default, reuseIdentifier: "cell")
    }
}

extension Table : UIScrollViewDelegate{

}