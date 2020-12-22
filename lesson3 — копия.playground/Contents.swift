// Lessons №3. "Комплексные типы данных"
import UIKit

enum FioMode: String {
    case full
    case middle
    case short
    
    var descrition: String {
        switch self {
        case .full:
            return "ФИО:"
        case .middle:
            return "ФИ:"
        case .short:
            return "Ф:"
        }
    }
}

func printFio(_ fio: (String, String, String), mode: FioMode) {
    switch mode {
    case .full:
        print(mode.descrition, fio.0, fio.1, fio.2)
    case .middle:
        print(mode.descrition, fio.0, fio.1)
    case .short:
        print(mode.descrition, fio.0)
    }
}
printFio(("Канавалов", "Иван", "Константинович"), mode: .full)
printFio(("Иванов", "Иван", "Иванович"), mode: .middle)

// Перечисления со связанными значениями:
enum SolveQuadraticResult {
    case twoSqr(one: Double, two: Double)
    case oneSqr(one: Double)
    case none(error: String)
}

func solveQuad(a: Double, b: Double, c: Double) -> SolveQuadraticResult {
    let d: Double = b * b - 4.0 * a * c
    if d == 0 {
        let x: Double = (-b + sqrt(d)) / (2.0 * a)
        return .oneSqr(one: x)
    } else if d > 0 {
        let x1: Double = (-b + sqrt(d) / (2.0 * a))
        let x2: Double = (-b - sqrt(d) / (2.0 * a))
        return .twoSqr(one: x1, two: x2)
    } else {
        return .none(error: "\nНет корней")
    }
}

let result = solveQuad(a: 4, b: -4, c: 1)
switch result {
case .twoSqr(let one, let two):
    print("\nПервый корень: \(one)\nВторой корень: \(two)")
case .oneSqr(let one):
    print("\nЕдинственный корень: \(one)")
case .none(let error):
    print(error)
}

// Структуры

enum Body {
    case coupe
    case harchback
    case offRoad
    case sedan
}

enum EnjineState {
    case start
    case stop
}

struct Car {
    let brand: String
    let model: String
    let color: UIColor
    let enjineVolume: Double
    let power: Double
    var price: Int {
        get {
            print("Текущая цена: \(self.price)")
            return self.price
        }
        set {
            print("Цена изменилась на \(newValue)")
        }
    }
    let odd: Double = 0
    let body: Body
    
    let enjineState: EnjineState = .stop
}

var ladaVesta = Car(brand: "Lada", model: "Vesta", color: .purple, enjineVolume: 1.6, power: 95, body: .sedan)

ladaVesta.price = 600_000
