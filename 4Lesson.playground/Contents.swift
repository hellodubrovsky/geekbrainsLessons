import UIKit

// MARK: - Пример структуры

enum CarDoorState {
    case open, close
}

enum Transmission {
    case manual, auto
}

struct Car {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: CarDoorState
}

var car1 = Car(color: .white, mp3: true,  transmission: .auto,   km: 0.0,   doorState: .close)
var car2 = Car(color: .black, mp3: true,  transmission: .manual, km: 120.0, doorState: .close)

print("Оба авто являются объектами структуры")
print(car1.km, ", ", car2.km)

// Как мы уже должны знать, здесь создастся клон машины car2. Изменяя car1 мы не повлияем на car2
car1 = car2

car1.km = 100

// Когда мы поменяли значение пробега первого автомобиля, пробег второго автомобиля не изменился
print(car1.km, ", ", car2.km)

car2.km = 300

// И наоборот изменение пробега второго авто не повлияло на пробег первого
print(car1.km, ", ", car2.km)


// MARK: - Пример с классом
// Но что, если мы объявим тип Car не как структуру, а как класс

class ClassCar {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: CarDoorState
    
    // У класса нет конструктора по умолчанию, в отличии от структуры. Так что добавим его вручную
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: CarDoorState) {
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
    }
}

var classCar1 = ClassCar(color: .white, mp3: true,  transmission: .auto,   km: 0.0,   doorState: .close)
var classCar2 = ClassCar(color: .black, mp3: true,  transmission: .manual, km: 120.0, doorState: .close)

print("\nОба авто являются объектами класса")
print(classCar1.km, ", ", classCar2.km)

// Как мы уже должны знать, здесь создастся дубликат ссылки на объект classCar2 в памяти. Изменяя classCar1 мы повлияем на classCar2
classCar1 = classCar2

classCar1.km = 100

// Когда мы поменяли значение пробега первого автомобиля, пробег второго автомобиля изменился
print(classCar1.km, ", ", classCar2.km)

classCar2.km = 300

// И наоборот изменение пробега второго авто повлияло на пробег первого
print(classCar1.km, ", ", classCar2.km)

// Это связано с тем, что классы являются ссылочными типами данных (Reference type)
// и, в данном случае, оба объекта ссылаются на одно и то же место в памяти

// MARK: - Статические методы и свойства класса

class OtherClassCar {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: CarDoorState
    
    // Создадим статическое свойство класса, которое будет принадлежать самому классу глобально,
    // а не каждому объекту класса в отдельности
    static var carCount = 0
    
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: CarDoorState) {
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
        
        // В конструкторе мы будем увеличивать счетчик класса, добавляя новый `произведенный` автомобиль
        OtherClassCar.carCount += 1
    }
    
    // То же самое и для статического метода. Он принадлежит самому классу
    // и позволяет обращаться к самому классу через ключевое слово self
    static func carCountInfo() {
        print("Выпущено автомобилей: \(self.carCount)")
    }
}

var otherClassCar1 = OtherClassCar(color: .white, mp3: true,  transmission: .auto,   km: 0.0,   doorState: .close)
var otherClassCar2 = OtherClassCar(color: .black, mp3: true,  transmission: .manual, km: 120.0, doorState: .close)

print("\nВызов статических свойств и методов")

// Вызовем статический метод класса
OtherClassCar.carCountInfo()
// Мы также можем обратиться к статическому свойству класса через имя самого класса
OtherClassCar.carCount

// MARK: - Вспомогательные конструкторы

class Rectangle {
    
    var sideA: Double                     // обязательные переменные
    var sideB: Double
    
    init(sideA: Double, sideB: Double) { // обязательный конструктор
        self.sideA = sideA
        self.sideB = sideB
    }
    
    convenience init(side: Double) {     // вспомогательный  конструктор
        // Вспомогательный конструктор обязан вызывать обычный конструктор класса
        self.init(sideA: side, sideB: side)
    }
    
    // Притом у нас всё так же может быть несколько обязательных конструкторов, как у структуры
    init(square: Double) {
        self.sideA = square
        self.sideB = square
    }
}

print("\nВызов конструкторов класса")

let rect1 = Rectangle(sideA: 2, sideB: 3)
let rect2 = Rectangle(side: 10)
let rect3 = Rectangle(square: 14)

print(rect1.sideA, " - ", rect1.sideB)
print(rect2.sideA, " - ", rect2.sideB)
print(rect3.sideA, " - ", rect3.sideB)


// MARK: - Наследование

// Если мы хотим дополнить наш базовый класс мы можем прибегнуть к наследованию
// В таком случае все свойства и методы родительского класса автоматом будут доступны в наследованном классе
class InheritClassCar: ClassCar {
    
}

var car3 = ClassCar(color: .black, mp3: true,  transmission: .manual, km: 120.0, doorState: .close)
var car4 = InheritClassCar(color: .red, mp3: true,  transmission: .manual, km: 0.0, doorState: .close)

// Обычно при наследовании базовый класс модифицируют или дополняют новым функционалом

enum CarHatchState {
    case open, close
}

// Добавим класс машины с люком, определив методы для его открытия и закрытия
class InheritClassSportCar: ClassCar {
    var hatchState: CarHatchState
    
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: CarDoorState, hatchState: CarHatchState) {
        // Инициализируем новое свойство
        self.hatchState = hatchState
        // Вызываем конструктор родительского класса для инициализации остальных свойств
        super.init(color: color, mp3: mp3, transmission: transmission, km: km, doorState: doorState)
    }
    
    func openHatch() {                  // Новый метод
        hatchState = .open
    }

    func closeHatch() {                // Новый метод
        hatchState = .close
    }
}

var car5 = InheritClassSportCar(color: .black, mp3: true,  transmission: .manual, km: 120.0, doorState: .close, hatchState: .close)

print("\nВызов нового метода наследника")

print(car5.hatchState)
car5.openHatch()
print(car5.hatchState)


// Если мы хотим модифицировать родительский класс мы можем сделать это следующим образом
class DecorativeSportCar: InheritClassSportCar {

    // Если мы хотим дополнить работу метода, мы вызываем метод родительского класса, а ниже добавляем новый код
    override func closeHatch() {
        super.closeHatch()
        print("Люк открыт")
    }
    
    // Либо мы просто указываем новый код в теле функции
    override func openHatch() {
        print("Пиииип, открывать люк запрещено")
    }
}

var car6 = DecorativeSportCar(color: .black, mp3: true,  transmission: .manual, km: 120.0, doorState: .close, hatchState: .close)

print("\nВызов переопределенного метода")

print(car6.hatchState)
car6.openHatch()
print(car6.hatchState)


print("\nПереопределение свойст класса")

// Мы также можем переопределить свойство класса
class People {
    var name: String
    let year: Int
    
    var greeting: String {
        return "Hello \(self.name)"
    }
    var age: Int {
        get {
            return 2020 - year
        }
    }
    
    init(name: String, year: Int) {
        self.name = name
        self.year = year
    }
}

class Guy: People {
    override var greeting: String {
        return "Yo \(self.name)!"
    }
    
    override var age: Int {
        get {
            print("I'm always young at heart!")
            return 10
        }
    }
}

let joe = People(name: "Joe", year: 1990)
print(joe.greeting)
print(joe.age)

let bill = Guy(name: "Bill", year: 1980)
print(bill.greeting)
print(bill.age)


// Можно создать такой класс, наследоваться от которого будет запрещено
// Для этого нужно указать перед объявлением класса final
final class OtherDecorativeSportCar: InheritClassSportCar {
    override func openHatch() {
        print("Пиииип, открывать люк запрещено")
    }
}

// Будет ошибка, потому как выше мы указали, что наследование от нашего класса запрещено
//class IllegalInheritClass: OtherDecorativeSportCar {
//
//}

// MARK: - Деинициализация

class SomeCar {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: CarDoorState

    static var carCount = 0
    
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: CarDoorState) {
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
        
        SomeCar.carCount += 1
    }
    
    deinit {
        SomeCar.carCount -= 1
    }
    
    static func carCountInfo() {
        print("Выпущено автомобилей: \(self.carCount)")
    }
}

var someCar1: SomeCar  = SomeCar(color: .black, mp3: true,  transmission: .manual, km: 120.0, doorState: .close)
var someCar2: SomeCar? = SomeCar(color: .black, mp3: true,  transmission: .manual, km: 120.0, doorState: .close)

print("\nКоличество выпущенных автомобилей в случае уничтожения одного")

print(SomeCar.carCount)
someCar2 = nil
print(SomeCar.carCount)

// MARK: - ARC и управление памятью

var testCar1 = SomeCar(color: .black, mp3: true,  transmission: .manual, km: 120.0, doorState: .close)
var testCar2 = SomeCar(color: .white, mp3: false,  transmission: .auto, km: 0.0, doorState: .close)
var testCar3 = SomeCar(color: .green, mp3: false,  transmission: .manual, km: 10.0, doorState: .close)
var testCar4 = SomeCar(color: .yellow, mp3: true,  transmission: .auto, km: 100.0, doorState: .open)
var testCar5 = SomeCar(color: .blue, mp3: true,  transmission: .manual, km: 60.0, doorState: .close)

print("\nЧто будет если не уничтожать автомобили самостоятельно")

print(SomeCar.carCount)
testCar2 = testCar1
testCar3 = testCar1
testCar4 = testCar1
testCar5 = testCar1
// Мы в каждой меременной стали ссылаться на один и тот же объект (потому что копируется ссылка на класс)
// Где хранятся остальные объекты в памяти мы больше не знаем, ссылки на них утеряны навсегда
// Механизм ARC удаляет такие объекты автоматически
print(SomeCar.carCount)

// Что если мы создадим переменные не глобально а в некотором локальном пространстве

if true { // После выхода из новой области видимости наши объекты удалятся сами
    var testCar6 = SomeCar(color: .yellow, mp3: false,  transmission: .auto, km: 100.0, doorState: .open)
    var testCar7 = SomeCar(color: .blue, mp3: false,  transmission: .manual, km: 60.0, doorState: .close)
    print(SomeCar.carCount)
}

print(SomeCar.carCount)

// MARK: - Утечки памяти

print("\nУтечки памяти")

class SportCar {
    var driver: Man?
    deinit{ // выведем в консоль сообщение о том, что объект удален
        print("Машина удалена из памяти")
    }
}
class Man {
    var myCar: SportCar?
    
    deinit{ // выведем в консоль сообщение о том, что объект удален
        print("Мужчина удален из памяти")
    }
}

var sportCar: SportCar? = SportCar()
var man: Man? = Man()

sportCar?.driver = man
man?.myCar = sportCar

sportCar = nil
man = nil
// Мы не увидим в консоле сообщения о том, что объекты были удалены из памяти
// Это происходит потому, что хоть мы на них и не ссылаемся, они сами хранят в себе ссылки друг на друга
// Тем самым количество ссылок на каждый объект не равно 0. ARC не может удалить каждый объект


print("\nОбъекты небыли удалены. Попробуем разорвать связь вручную")

// Мы можем вручную избежать этого, если разорвем связь между обхектами вручную
var sportCar2: SportCar? = SportCar()
var man2: Man? = Man()

sportCar2?.driver = man2
man2?.myCar = sportCar2

sportCar2 = nil
// Здесь мы разрываем связь между ещё не удаленным из памяти мужчиной и уже удаленной машино
man2?.myCar = nil
man2 = nil

print("\nОбъекты были удалены, но попробуем создать слабую связь между объектами, чтобы это произошло автоматически")

// Чтобы исправить такую ситуацию, нам нужно позволить связям между объектами разрываться
// Но только в том случае, когда других `сильных` связей на этот объект нет
class WeakSportCar {
    weak var driver: OtherMan?
    deinit{ // выведем в консоль сообщение о том, что объект удален
        print("Машина удалена из памяти")
    }
}
class OtherMan {
    var myCar: WeakSportCar?
    
    deinit{ // выведем в консоль сообщение о том, что объект удален
        print("Мужчина удален из памяти")
    }
}

var weakSportCar: WeakSportCar? = WeakSportCar()
var otherMan: OtherMan? = OtherMan()

weakSportCar?.driver = otherMan
otherMan?.myCar = weakSportCar

weakSportCar = nil
otherMan = nil

// Weak ссылками могут быть только переменные (объявленные через var)
// Аналог weak ссылки для константы (объявленной через let) будет Unowned ссылка

print("\nИспользование unowned ссылки")

class Woman {
    var myPassport: Passport?
    deinit{     // выведем в консоль сообщение о том, что объект удален
        print ("Женщина удалена из памяти")
    }
}
class Passport {
    let woman: Woman // Если указать unowned объекты не будут держаться в памяти
    init(woman: Woman) {
        self.woman = woman
    }
    deinit{     // выведем в консоль сообщение о том, что объект удален
        print("Паспорт удален из памяти")
    }
}
var woman: Woman? = Woman()
var passport: Passport? = Passport(woman: woman!)
woman?.myPassport = passport
print("Пробуем удалить женщину")
woman = nil // объект еще не удален, его удерживает паспорт, если не указать unowned
print("Женщина удалена руками")
print("Пробуем удалить паспорт")
passport = nil     // теперь удалены оба объекта
print("Паспорт удален руками")
