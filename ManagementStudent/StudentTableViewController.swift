//
//  StudentTableViewController.swift
//  ManagementStudent
//
//  Created by Pham Huu Nhu on 5/9/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {

    
    lazy var students: [Student] = {
        return Student.createStudent()
    }()
    
    
    var filteredStudent = [Student]()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = editButtonItem
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.tableHeaderView = searchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        //reload lại dữ liệu
        if Constants.isLoadDataAgain {
            let student: Student = Constants.student
            students.append(student)
            tableView.reloadData()
            Constants.isLoadDataAgain = false
        }
        super.viewWillAppear(true)
        
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredStudent.count
        }
        return students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        
        let student: Student;
        if searchController.isActive && searchController.searchBar.text != "" {
            student = filteredStudent[indexPath.row]
        } else {
            student = students[indexPath.row]
        }
        cell.configCellWith(student: student)
        return cell
    }
    
    //Hiển thị chi tiết
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            
            let viewController = segue.destination as! StudentDetailViewController
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let student: Student
                if searchController.isActive && searchController.searchBar.text != "" {
                    student = filteredStudent[indexPath.row]
                } else {
                    student = students[indexPath.row]
                }
                
                viewController.student = student
            }
            
        }
    }

    
    //Tìm kiếm
    func filterContentForSearchText(_ searchText: String) {
        filteredStudent = students.filter({(student : Student) -> Bool in
            return student.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    //Trượt để xoá
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            students.remove(at: indexPath.row)
            //update table view with new data source
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    //Sắp xếp
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //get data in sourceIndexPath
        let currentStudent = students[sourceIndexPath.row];
        students.remove(at: sourceIndexPath.row)
        students.insert(currentStudent, at: destinationIndexPath.row)
        
    }

}

extension StudentTableViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}

extension StudentTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
