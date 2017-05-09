//
//  StudentDetailViewController.swift
//  ManagementStudent
//
//  Created by Pham Huu Nhu on 5/9/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {

    
    @IBOutlet weak var lblStudentName: UILabel!
    
    @IBOutlet weak var lblStudentYearOld: UILabel!
    
    @IBOutlet weak var lblStudentSchool: UILabel!
    
    @IBOutlet weak var lblStudentInformation: UILabel!
    
    var student: Student!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblStudentName.text = student.name
        lblStudentYearOld.text = String(student.yearOld)
        lblStudentSchool.text = student.university
        lblStudentInformation.text = student.information
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
