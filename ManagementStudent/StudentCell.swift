//
//  StudentCell.swift
//  ManagementStudent
//
//  Created by Pham Huu Nhu on 5/9/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    
    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var lblStudentYearOld: UILabel!
    
    func configCellWith(student: Student) {
        lblStudentName.text! = student.name
        lblStudentYearOld.text! = String(student.yearOld)
        
    }

}
