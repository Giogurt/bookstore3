//
//  MasterViewController.swift
//  Bookstore
//
//  Created by Iván Alejandro Bustillos Sánchez on 3/3/20.
//  Copyright © 2020 owo. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, BookStoreDelegate {
    
    
    func newBook(_ controller: AnyObject, newBook: Book) {
        myBookStore.bookList.append(newBook)
        tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)
    }
    
    func editBook(_ controller: AnyObject, editBook: Book) {
        if let row = tableView.indexPathForSelectedRow?.row {
            myBookStore.bookList[row] = editBook
        }
        
        tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)
    }
    
    func deleteBook(_controller: AnyObject) {
        if let row = tableView.indexPathForSelectedRow?.row {
            myBookStore.bookList.remove(at: row)
        }
        
        tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)
    }
    

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var myBookStore = BookStore()
        
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any) {
        performSegue(withIdentifier: "addBookSegue", sender: nil)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedBook:Book = myBookStore.bookList[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = selectedBook
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.delegate = self
            }
        } else if segue.identifier == "addBookSegue" {
            let vc = segue.destination as! AddViewController
            vc.delegate = self
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBookStore.bookList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        myBookStore.bookList.sort{$0.title < $1.title}
        cell.textLabel!.text = myBookStore.bookList[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

