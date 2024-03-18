struct Employee {
    let name: String
    let salary: Double
    let position: String
}

class Pizzeria {
    var employees: [Employee]
    var tables: [Table]
    
    init() {
        employees = []
        tables = []
    }
    
    func addEmployee(name: String, salary: Double, position: String) {
        let employee = Employee(name: name, salary: salary, position: position)
        employees.append(employee)
    }
    
    func addTable(seats: Int) {
        let table = Table(seats: seats, pizzeria: self)
        tables.append(table)
    }
}

class Table {
    let seats: Int
    let pizzeria: Pizzeria
    
    init(seats: Int, pizzeria: Pizzeria) {
        self.seats = seats
        self.pizzeria = pizzeria
    }
    
    func canAccommodateGuests(guests: Int) -> Bool {
        return seats >= guests
    }
}

// Например :
let pizzeria = Pizzeria()

pizzeria.addEmployee(name: "John", salary: 1000, position: "Cashier")
pizzeria.addEmployee(name: "Alice", salary: 1500, position: "Chef")

pizzeria.addTable(seats: 4)
pizzeria.addTable(seats: 6)

let table1 = pizzeria.tables[0]
let table2 = pizzeria.tables[1]

print(table1.canAccommodateGuests(guests: 5)) // false
print(table2.canAccommodateGuests(guests: 3)) // true
