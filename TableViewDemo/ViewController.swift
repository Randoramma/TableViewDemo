//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Randy McLain on 2/26/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // properties
    
    // people in the array.
    let ray =  Person(firstName: "Ray", lastName: "Stantz", theStudent: false)
    let peter = Person(firstName: "Peter", lastName: "Venkman", theStudent: false)
    let egon = Person(firstName: "Egon", lastName: "Spengler", theStudent: false)
    let winston = Person(firstName: "Winston", lastName: "Zeddemore", theStudent: false)
    let louis = Person(firstName: "Louis", lastName: "Tully", theStudent: false)

    
    // instantiate the the array.
    var myGhostbusters = [Person]()

    // instantiate the iterator
    var myIterator = 0

    // out storyboard table reference
    @IBOutlet weak var myMainTableView: UITableView!
    
    // setup 
    override func viewDidLoad() {
        super.viewDidLoad()
        // added a title to the table view page.
        self.title = "Home"
        
        // add person objects created in this class to the array.
        myGhostbusters += [ray, peter, egon, winston, louis]
        
        // this is the datasource for the table
        self.myMainTableView.dataSource = self
        
        // this is the delegate for the table
        self.myMainTableView.delegate = self
    }
       // how many rows to prepare in the table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return the number of rows to the tableView.
        return self.myGhostbusters.count
    }
    
    // what is to be placed in a cell for the table view.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =
        // label the reuse indentifer with the name of the first cell in the table.
        
        //step 1 dequeue an available cell
        // the string is the identifier from the cell we added to the table in the storyboard.
        // "as" casts the cell object as a UITableViewCell
        self.myMainTableView.dequeueReusableCellWithIdentifier("myFirstCell", forIndexPath: indexPath) as UITableViewCell

        // step 2 give me the object at the index (whatever index we are at) and assign it to the person
        let name = myGhostbusters[indexPath.row].toString()
        
        // assign the information to the cell.
        cell.textLabel?.text = name
        
        // return the cell.
        return cell
    }
    
    // called everytime someone clicks on a cell.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        // when the cell is clicked, we make a new view controller instance with a green background.
        let myDataViewController = UIViewController()
        myDataViewController.view.backgroundColor = UIColor.greenColor()
        
        // push the new view controller onto the stack of view controllers.
        self.navigationController?.pushViewController(myDataViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

