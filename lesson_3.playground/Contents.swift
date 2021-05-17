import UIKit


/*

// Создание кортежа
let users = [("Иванов", "Иван", "Иванович"),
             ("Петров", "Петр", "Петрович"),
             ("Сидоров", "Сидор", "Сидорович"),
             ("Александров", "Александр", "Александрович")]

func printUsers(_ users: [(String, String, String)], mode: Int) {
    
    for user in users {
        switch mode {
        case 0:
            print(user.0, user.1, user.2)
        case 1:
            print(user.0, user.1)
        case 2:
            print(user.0)
        default:
            fatalError("Неверный mode")
        }
    }
}

//printUsers(users, mode: 5)

enum PrintUserInfoMode: String {
    case short = "Сокращенный режим"
    case middle = "Обычный режим"
    case full = "Подробный режим"
}

func printUsers(_ users: [(String, String, String)], mode: PrintUserInfoMode) {
    
    print(mode.rawValue)
    
    for user in users {
        switch mode {
        case .full:
            print(user.0, user.1, user.2)
        case .middle:
            print(user.0, user.1)
        case .short:
            print(user.0)
        }
    }
}

//printUsers(users, mode: .full)




enum Numbers: Int {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six = 999
    case seven
    case eight
    case nine
}

print(Numbers.five.rawValue)

let variant1 = Numbers(rawValue: 5)
variant1 == Numbers.five

let variant2 = Numbers(rawValue: 60000)
variant2 == Numbers.seven



enum QuadraticEquationDecision {
    case twoRoot(x1: Double, x2: Double)
    case oneRoot(Double)
    case notRoot
}


func solveTheQuadraticEqaation(a: Double, b: Double, c: Double) -> QuadraticEquationDecision {
    let d = pow(b, 2) - 4 * a * c
    
    if d > 0 {
        let root1 = (-b + sqrt(d)) / (2 * a)
        let root2 = (-b - sqrt(d)) / (2 * a)
        return .twoRoot(x1: root1, x2: root2)
    } else if d == 0 {
        let root = -b / (2 * a)
        return .oneRoot(root)
    }
    
    return .notRoot
}


//Задержка вывода кода
sleep(3)

let result = solveTheQuadraticEqaation(a: 1, b: -5, c: 6)

switch result {
    case let .twoRoot(root1, root2):
        print("Два корня", root1, root2)
    case.oneRoot(let root):
        print(root)
    case .notRoot:
        print("Нет корней")
}

*/




import UIKit

// MARK: - Перечисления

let users = [("Иванов", "Иван", "Иванович"),
             ("Петров", "Петр", "Петрович"),
             ("Сидоров", "Сидор", "Сидорович"),
             ("Александров", "Александр", "Александрович")]

// Функция режим вывода в которой указывается целым числом
// При использовании функции, не заглядывая внутрь сложно понять, какое число передать
// Нужно описывать default случай, который не предполагается на самом деле
func printUsers(_ users: [(String, String, String)], mode: Int) {
    for user in users {
        switch mode {
        case 1:
            print(user.0, user.1, user.2)
            
        case 2:
            print(user.0, user.1)
            
        case 3:
            print(user.0)
            
        default:
            fatalError("Поддерживается только два режим")
        }
    }
}

printUsers(users, mode: 1)


// Заведем перечисление всех возможных режимов вывода на экран
enum PrintUserInfoMode {
    case short
    case middle
    case full
}

func printUsers(_ users: [(String, String, String)], mode: PrintUserInfoMode) {
    for user in users {
        switch mode {
        case .full:
            print(user.0, user.1, user.2)
            
        case .middle:
            print(user.0, user.1)
            
        case .short:
            print(user.0)
        }
    }
}

printUsers(users, mode: PrintUserInfoMode.full) //Можно просто .full

// Можно завести перечисление, которое будет также хранить значение произвольного типа
enum printUserInfoModeWithValue: String {
    case short = "Сокращенный режим"
    case middle = "Обычный режим"
    case full = "Подробный режим"
}

func printUsers(_ users: [(String, String, String)], mode: printUserInfoModeWithValue) {
    print(mode.rawValue, ":\n")
    for user in users {
        switch mode {
        case .full:
            print(user.0, user.1, user.2)
            
        case .middle:
            print(user.0, user.1)
            
        case .short:
            print(user.0)
        }
    }
}

printUsers(users, mode: printUserInfoModeWithValue.full)


// Если мы не добавили описание на заданный тип, оно будет присвоено автоматически
enum SomeEnum: String {
    case one
}

SomeEnum.one.rawValue // Будет строка с именем кейса "one"



// В случае типа Int
enum Numbers: Int {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
}

let fiveNumber = Numbers(rawValue: 5)
fiveNumber?.rawValue


// Функция, которая решает квадратное уравнение и возвращает кортеж из корней
func solveTheQuadraticEquation(a: Double, b: Double, c: Double) -> (Double?, Double?) {
    let discriminant = pow(b, 2) - 4 * a * c

    if discriminant > 0 {
        let x1 = (-b + sqrt(discriminant)) / (2 * a)
        let x2 = (-b - sqrt(discriminant)) / (2 * a)
        return (x1, x2)
    } else if discriminant == 0 {
        let x = -b / (2 * a)
        return (x, nil)
    }
        
    return (nil, nil)
}

let quadraticEquationDecision = solveTheQuadraticEquation(a: 1, b: -5, c: 6)

// Не совсем удобно извлекать кортежи в явном виде. Вариантов может быть больше чем 3 для другого случая
if let root1 = quadraticEquationDecision.0, let root2 = quadraticEquationDecision.1 {
    print("Два корня:", root1, root2)
} else if let root = quadraticEquationDecision.0 {
    print("Один корень:", root)
} else {
    print("Нет корней")
}


// Заведем перечисление и свяжем кайсы с параметрами
enum QuadraticEquationDecision {
    case twoRoots(x1: Double, x2: Double)
    case oneRoot(x: Double)
    case noDecision
}

func solveTheQuadraticEquationWithEnum(a: Double, b: Double, c: Double) -> QuadraticEquationDecision {
    let discriminant = pow(b, 2) - 4 * a * c

    if discriminant > 0 {
        let x1 = (-b + sqrt(discriminant)) / (2 * a)
        let x2 = (-b - sqrt(discriminant)) / (2 * a)
        return .twoRoots(x1: x1, x2: x2)
    } else if discriminant == 0 {
        let x = -b / (2 * a)
        return .oneRoot(x: x)
    }
        
    return .noDecision
}

let quadraticEquationDecision2 = solveTheQuadraticEquationWithEnum(a: 1, b: -5, c: 6)

// Обработать такое перечисление с помощью конструкции switch куда проще
switch quadraticEquationDecision2 {
case let .twoRoots(root1, root2):
    print("Два корня:", root1, root2)
    
case let .oneRoot(x: root):
    print("Один корень:", root)
    
case .noDecision:
    print("Нет корней")
}


// MARK: - Структуры

// Попробуемописать свойства трех автомобилей без структуры
enum HondaDoorState: String {
    case open = "Открыты"
    case close = "Закрыты"
}
enum Transmission {
    case manual, auto
}
let car1Color = "white"
let car1Mp3 = true
let car1Transmission = Transmission.auto
var car1Km = 0.0
var car1DoorState = HondaDoorState.open
let car2Color = "black"
let car2Mp3 = false
let car2Transmission = Transmission.auto
var car2Km = 0.0
var car2DoorState = HondaDoorState.open
let car3Color = "red"
let car3Mp3 = true
let car3Transmission = Transmission.manual
var car3Km = 12.0
var car3DoorState = HondaDoorState.open

// Довольно громоздко. Попробуем объединить свойства каждого автомобиля в одной структуре
// Сделать это можно только в том случае, если свойства всех автомобилей одинаковые

struct Car {
    let color: String
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState
}

let car1 = Car(color: "white", mp3: true,  transmission: .auto,   km: 0.0,   doorState: .close)
let car2 = Car(color: "black", mp3: true,  transmission: .manual, km: 120.0, doorState: .close)
let car3 = Car(color: "red",   mp3: false, transmission: .manual, km: 0.0,   doorState: .open)
let car4 = Car(color: "green", mp3: true,  transmission: .auto,   km: 0.0,   doorState: .close)

print(car2)

func printCarProperties(car: Car) {
    print("-----------------------------------")
    print("Цвет: \(car.color)")
    print("Пробег: \(car.km)")
    
    // Первый вариант вывода перечисления
    switch car.transmission {
    case .auto:
        print("Трансмиссия: Автомат")
    case .manual:
        print("Трансмиссия: Механика")
    }
    
    // Второй вариант вывода перечисления (куда короче)
    print("Поддержка mp3: \(car.mp3 ? "Да" : "Нет")")
    
    // Третий вариант (предпочтительный)
    print("Двери: \(car.doorState.rawValue)")
}

// Можно в качестве цвета использовать стандартное представление цвета из библиотеки UIKit
// Здесь мы задаем новое свойство, расширяя возможности класса UIColor, чтобы получить текстовое представление цвета
extension UIColor {
    
    var name: String? {
        switch self {
        case UIColor.black: return "black"
        case UIColor.darkGray: return "darkGray"
        case UIColor.lightGray: return "lightGray"
        case UIColor.white: return "white"
        case UIColor.gray: return "gray"
        case UIColor.red: return "red"
        case UIColor.green: return "green"
        case UIColor.blue: return "blue"
        case UIColor.cyan: return "cyan"
        case UIColor.yellow: return "yellow"
        case UIColor.magenta: return "magenta"
        case UIColor.orange: return "orange"
        case UIColor.purple: return "purple"
        case UIColor.brown: return "brown"
        default: return nil
        }
    }
}

printCarProperties(car: car2)

// Как мы уже должны знать, здесь создастся клон машины car2. Изменяя testCar мы не повлияем на car2
var testCar = car2

// Цвет поменять у нашей машины нельзя, потому что это свойство объявлено как let
//testCar.color = .red
testCar.km = 100

printCarProperties(car: car2)
printCarProperties(car: testCar)




// Посмотрим на реализацию структуры, имеющей вычисляемые свойства
struct Circle {
    var radius: Double
    var diameter: Double {
        get {
            radius * 2
        }
        set(newDiameter) { // Можно не указывать имя нового значения, по умолчанию оно иммет вид newValue
            radius = newDiameter / 2
//            radius = newValue / 2
        }
    }
}

var circle = Circle(radius: 10)
circle.diameter
circle.diameter = 100
circle.radius


// Можно использовать вычисляемое свойство только с get, однако только с set нельзя
struct Rectangle {
    var sideA: Double
    var sideB: Double
    
    var perimeter: Double {
        get {
            return (sideA + sideB) * 2
        }
    }
}

var rect = Rectangle(sideA: 2, sideB: 3)
rect.perimeter

// Задать свойство, которое объявлено как get (без set) нельзя
//rect.perimeter = 100

// У свойств структуры могут быть так называемые наблюдатели свойств
// Это блоки кода, которые будут выполнены когда свойство поменяет свое значение
struct MyCar {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double {
        didSet { // Блок, который вызывается после изменения свойства
            let distance = km - oldValue // Переменная oldValue системная, она хранит прежнюю величину свойства, до изменения
            print("Пройден новый участок пути расстоянием \(distance) км.")
        }
    }
    var doorState: HondaDoorState {
        willSet { // Блок, который вызывается до изменения свойства
            if newValue == .open { // newValue также системное имя переменной, хранящей новое значение свойства
                print("Двери будут открыты")
            } else {
                print("Двери будут закрыты")
            }
        }
    }
}

var myCar = MyCar(color: .green, mp3: true,  transmission: .auto,   km: 0.0,   doorState: .close)

myCar.doorState = .open
myCar.km = 10
myCar.doorState = .close


// Попробуем теперь добавить мтеоды для нашей структуры
// Методы это те же функции, но являющиеся частью структуры
struct SomeCar {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState

    mutating func closeDoor() { // Если метод меняет свойства структуры, перед объявлением функции нужно добавить mutating
        self.doorState = .close // self - обращение к текущему объекту типа заданной структуры SomeCar
    }
    
    mutating func openDoor() {
        doorState = .open // self писать не обязательно, он понимается автоматически, а вот mutating прийдется
    }
    
    func printDistance() {
        print("Автомобиль проехал \(km) км")
    }
}

var someCar = SomeCar(color: .green, mp3: true,  transmission: .auto,   km: 0.0,   doorState: .close)

someCar.doorState
someCar.openDoor()
someCar.doorState

someCar.printDistance()
someCar.km = 33
someCar.printDistance()


// Конструкторы
struct RectangleWithInit {
    var sideA: Double
    var sideB: Double
    
    var perimeter: Double {
        get {
            return (sideA + sideB) * 2
        }
    }

    
    init() { // Каждый конструктор должен определить все свойства структуры (вычисляемые определять не требуется, они будут вычислены сами)
        sideA = 3
        sideB = 5
    }
    
    init(square: Double) { // Можно передать один параметр, но проинициализировать оба свойства
        sideA = square
        sideB = square
    }
    
    /*
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA // Здесь писать self обязательно, если имя свойства структуры совпадает с именем принимаемого аргумента в init
        self.sideB = sideB
    }
    */
    
    init(storona1: Double, storona2: Double) { // Имена аргументов произвольны
        sideA = storona1
        sideB = storona2
    }
    
    init?(sideA: Double, sideB: Double) {
        guard sideA > 0 && sideB > 0 else { return nil }
        self.sideA = sideA
        self.sideB = sideB
    }
}
// Как только мы добавляем инициализатор, нам перестает быть доступен инициализатор по умолчанию для всех свойств разом

let rect2 = RectangleWithInit(square: 10)
let rectError = RectangleWithInit(sideA: -1, sideB: 0)

rectError?.perimeter


// Уровни доступа

// Структура доступна только из текущего файла
fileprivate struct OnlyForThisFile {
    var a: Int
    private var b: Int //Переменная недоступная извне структуры
    
    func printB() {
        print(b)
    }
    
    public init(a: Int, b: Int) { // Инициализатор доступен извне структуры
        self.a = a
        self.b = b
    }
}

// Экземпляр структуры тоже должен быть доступен из текущего файла
fileprivate let onlyForThisFile = OnlyForThisFile(a: 1, b: 3)
print(onlyForThisFile.a)
onlyForThisFile.printB()


