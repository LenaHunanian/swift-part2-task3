class Person {
    let name: String
    let age: Int
    var isAdult: Bool {return  age >= 18 }
    static let minAgeForEnrollment = 16
    lazy var profileDescription: String = {
        return "\(name) is \(age) years old"
    }()
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    init?(age: Int) {
        guard age >= Person.minAgeForEnrollment else {
            return nil
        }
        self.name = "Undefined"
        self.age = age
    }
}

class Student: Person {
    let studentID: String
    let major: String

    nonisolated(unsafe) static var studentCount: Int = 0
    weak var advisor: Professor?
    var formattedID: String {
        return "ID: \(studentID.uppercased())"
    }
    
    required init(name: String, age: Int, studentID: String, major: String) {
        self.studentID = studentID
        self.major = major
        super.init(name: name, age: age)
        Student.studentCount += 1
        
            }
    convenience init(name: String, age: Int, studentID: String) {
        self.init(name: name, age: age, studentID: studentID, major: "")
    }
}
class Professor: Person {
    let faculty: String
    nonisolated(unsafe) static var professorCount: Int = 0
    
    init(name: String, age: Int, faculty: String) {
        self.faculty = faculty
        super.init(name: name, age: age)
        Professor.professorCount += 1

    }
}
struct University {
    let name: String
    let location: String
    var description: String {
        return "University \(name) is located in \(location)"
    }
}

