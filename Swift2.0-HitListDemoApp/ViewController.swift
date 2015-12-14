//
//  ViewController.swift
//  Swift2.0-HitListDemoApp
//
//  Created by User on 12/14/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "\"The List\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addName(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Name", message: "Add a name", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "Save", style: .Default,
            handler: { (action:UIAlertAction) -> Void in
            
            let textField = alert.textFields!.first
            self.names.append(textField!.text!)
            self.tableView.reloadData()
            })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (alert: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell?.textLabel?.text = names[indexPath.row]
        return cell!
    }

}

