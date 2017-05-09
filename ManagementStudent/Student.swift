//
//  Student.swift
//  ManagementStudent
//
//  Created by Pham Huu Nhu on 5/9/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import Foundation
class Student {
    var name: String
    var university: String
    var information: String
    var yearOld: Int
    
    init(name: String, university: String, information: String, yearOld: Int) {
        self.name = name
        self.university = university
        self.information = information
        self.yearOld = yearOld
    }
    
    class func createStudent() -> [Student]{
        var students = [Student]()
        
        students.append(Student(name: "Thosmas Muler", university: "Harvert", information: "A handsome boy", yearOld: 19))
        
        students.append(Student(name: "Camile", university: "League of Legend", information: "A beautiful girl", yearOld: 18))
        
        students.append(Student(name: "LeeSin", university: "Demacia", information: "A strong boy!", yearOld: 25))
        return students
    }
}
