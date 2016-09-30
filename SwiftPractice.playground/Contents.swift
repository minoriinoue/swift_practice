//: Playground - noun: a place where people can play

import UIKit

// No need for ;
// println is duplicated

// var ... variable
// var msg: String (var var_name: type)
// var msg: String = "hoge"
// var msg = "hoge"

// Constant ... Cannot change
// let s = "hoge"

// Unwind variables within string. ... \(v)
// "msg: \(msg)"

// Basic type:
//   String
//   Int
//   Float
//   Bool       true false
//   nil

// + - * / %
// ++ -- ... incremental

// Concat strings
// a + b
// E.g. let s = a + b

// && || !

// convertion
// let a = "hkt"
// let b = 48
// let c = a + String(b)

// tuple
// let error = (404, "not found")
// error.0
// error.1
// 
// let error = (code: 404, msg: "not found")
// error.code
//
// let (code, msg) = error
// code
//
// let (code, _) = error
// 安全に値を破棄

/*
 配列, 同じデータ型しかダメ
 var colors: [String] = ["blue", "pink"]
 colors[0]
 colors.count
 colors.isEmpty
 colors.append("green")
 ...
 
 空の配列: var emptyArray: [String]()
 */

/*
 辞書
 var users: [String: Int] = ["Minori": 500]
 
 let keys = Array(users.keys)
 let values = Array(users.values)
 
 var emptyDict = [String: Int]()
 */

/*
 if statement
 
 if score > 80 {
    result = "great"
 } else if score > 60 {
    result =
 } else {
    result = "soso"
 }
 
 三項演算子
 result = score > 80 ? "Great" : "so so"
 */

/* switch statement
 switch num {
 case 0:
 case 1, 2, 3:
 case 4...6: // 4,5,6
 case 7..<9: // 7,8
 case let n where n > 10:
 default:
 }
 
 breakはいらない, 何もしないときはbreakとかく
 次の処理もしたいときfallthroughとかくと次の条件も見てくれる
 */

/*
 while n < 10 {
 }
 
 do {
 } while n < 10
 
 for var i = 0; i < 10; i++ {
    if i == 3 {
        continue // skip
        break // break
    }
 }
 
 for i in 0...9 {
    println(i)
 }
 
配列、辞書形のときに便利
 for (k,v) in d {
    key, value
 }
 */

/*
 
 Optionalでない型はnilになりえない
 
 // 宣言のとき
 var s: String?
 s = nil
 
 // Optionalの値を取り出すときは!をつける。 unwrapすると言う
 let msg = "hello " + name! // nameがnilのときはエラーが出る
 
 if name != nil { で確認
 
 または
 
 if let s = name {
 let msg = "hello " + s //この中では単にsとかける
 
 まずsにnameを入れようとして、nilであれば、false nilでなかったらtrueになるので、安全
 に代入することができる
 
 
 var label: String! // nilになっている
 label = "score"　//その後はnilになりえないときに!をつける
 // iOS アプリを作っていく過程で、初期化の時に一瞬 nil になるけどそのあとは値をずっと保持するオブジェクトをよく扱うようになるので、こうした仕組みが用意されています。
 
 
 */

/*
 関数
 
 func sayHi(){
    print("Hi")
 }
 
 sayHi()
 
 引数
 func sayHi(name: String) {
    print("Hi " + name)
 }
 
 sayHi("Tom")
 
 名前をつけて渡すとき
 func sayHi(#name: String) {
 print("Hi " + name)
 }
 
 sayHi(name: "Tom")
 
 初期値
 
 func sayHi(#name: String = "bob") {
    print("hi " + name)
 }
 
 sayHi()
 sayHi(name: "Tom")
 
 
 値を返すとき
 func sum(a: Int, b:Int) -> Int {
    return a + b
}
 print(sum(5,12))
 
 
2つ
 func swap(a: Int, b: Int) -> (Int, Int) {
    return (b, a)
 }
 swap(5, 2)
*/

/*
 普通は関数は値渡し。値を変更したいときは。。。
 
 func f(inout a: Int) {
    a = 20
 }
 f(&20)
 
 */

/*
 列挙型
 
 enum Result {
    case Success
    case Error
 }
 
 // var r: Int
 var r: Result
 r = Result.Success
 r = .Success // rはResult型であることがわかっているのでこれでもok
 
 Result.Error.rawValue // 1 
 
 関数も定義することができる
 enum Result {
    case Success
    case Error
 func getMessage() -> String {
    switch self {
    case .Success:
        return "OK"
    }
    case .Error:
        return "NG"
    }
 }
 
 Result.Error.getMessage() // "NG"
 
 */

/*
 クラス (User)
 - 変数 name, score: プロパティ
 - 関数 sayHi(): メソッド
 
 class User {
    // 注意：クラスのプロパティは初期化されているか、Optionalになっている必要
    // 以下だとエラーが出る
    // よって、オプショナルにしてエラーを消すか、もしくは初期化するための特殊な
    // メソッドを作らないといけない
    // --> init関数
    var name: String
    var score: Int = 0
    init(name: String) {
        self.name = name
    }
    func upgrade() {
        score++
    }
 }
 
 var tom = User(name: "Tom")
 tom.name // Tom
 tom.score // 0
 tom.upgrade()
 tom.score // 1
 
 */

/*
 クラスの継承
 class AdminUser: User {
    func reset() {
        score = 0
    }
    override func upgrade() { //上書きすることを明示するためにoverrideとかく
        // 親クラスが
        // final func upgrade() {}
        // となっていた場合は、
        // 上書きが禁止される
        score += 2
        super.upgrade() // 親クラスのupgrade関数にもアクセスできる with super
    }
}
 
 var bob = AdminUser(name: "Bob")
 bob.name
 bob.score
 bob.upgrade()
 bob.reset()
 
 */

/*
 プロトコル .. 何か複数のものを継承させたい、クラスを複数のプロトコルに従って実装させたい時
 protocol Student {
    var studentId: String {get set} // 継承したものがgetできるものなのか、setできるものなのかを指定。
    // ここではsetと書いてあるので、このプロトコルを受け継いだ先で、letとして定義してしまうと、エラーが出る
    func study()
 }
 
 // 継承させると、絶対プロとこるで指定されたvariableと、method
 // を書かないといけなくなる
 class User: Student, OtherProtocol {
    var name: String
    var score: Int = 0
    init(name: String) {
        self.name = name
    }
    func upgrade() {
        score++
    }
 }
 
 */

/*
 動的にプロパティを定義する
 class User {
    var name: String
    var score: Int = 0
    var level: Int {
        get {  
            return Int(score/10) // self.scoreでも良いが、scoreだけで良い
        }
        set {
            score = Int(newValue * 10) // newValueで代入された値をとってこれる
        }
    }
    init(name: String) {
        self.name = name
    }
    func upgrade() {
        score++
    }
 }
 
 var tom = User(name: "tom')
 tom.level // 0
 tom.score = 52
 tom.level // 5
 tom.level = 8
 tom.score // 80
 
 
 class User {
    var name: String
    var score: Int = 0
    var level: Int {
        return Int(score/10) // get methodだけの時はこのようにかける
    }
    init(name: String) {
        self.name = name
    }
    func upgrade() {
        score++
    }
 }
 
 プロパティへのget setの前後に何か処理を入れたい時
 class User {
    var name: String
    var score: Int = 0 {
        willSet { // setする前
            print("\(score) -> \(newValue)")
        }
        didSet { // setした後
            print("\(oldValue) -> \(score)")
        }
    }
    var level: Int {
        return Int(score/10) // get methodだけの時はこのようにかける
    }
    init(name: String) {
        self.name = name
    }
    func upgrade() {
        score++
    }
 }
 
 */

/*
 Optional Chaining
 
 class User {
    var blog: Blog?
 }
 
 class Blog {
    var title: String = "String"
 }
 
 var tom = User()
 tom.blog = Blog()
 
 tom.blog!.title
 // Optional型なので、!で取り出す。
 // が、ここでblogがnilだった時に、titleを取り出そうとするとエラー
 // checkするのも大変なので、optional chaining
 
 tom.blog?.title
 // blogがnilだった時はそれで評価を止めてくれる
 
 例えばこう言うのがよく使う
 if let t = tom.blog?.title {
    println(t)
 }
 
 */

/*
 オブジェクトを配列として使う
 class User {
    var name: String
    init(name: String) {
        self.name = name
    }
 }
 
 class AdminUser: User {}

 let tom = User(name: "Tom")
 let bob = AdminUser(name: "Bob")
 
 let users: [Users] = [tom, bob] // let users = [tom, bob]でも一緒
 // Swiftが、bobがUserから継承されていると認識して、これでもエラーがでない
 
 for user in users {
    if user is AdminUser { // isでクラスが同じか確認できる
        let u = user as AdminUser // userはUserクラスとして扱われているので、ダウンキャストしないとダメ
        println(u.name)
    }
    // 以下のような書き方もできる
    if let u = user as? AdminUser { // as?でAdminUserにダウンキャストして、うまくいったらブロック内の処理が
        //行われ、うまくいかなかったらnilを返すので安全に処理が終了する
        println(u.name)
    }
 }
 
 未定義のクラスを扱う場合
 let steve SomeUser()
 let users: [AnyObject] = [tom, bob, steve]
 としてAnyObjectとすればエラーが出てこない
 
 */

/*
 構造体とクラスの違い...コピーをした時のbehabiour と、自分のプロパティを変えれるか
 シンプルな値群を扱うには構造体がいい
 
 コピーの時
 構造体... コピー
 クラス... 参照先を共有しているので、コピーしたvaribaleで値を変えると、コピー元の値も変わる
 // メモリー消費を抑えるためにこうなっているらしい
 
 構造体...自分のプロパティを変えられない
 // 変える時はmutatingをつける
 struct UserStruct {
    var name: String
    var score: Int = 0
    init(name: String) {
        self.name = name
    }
    mutating func upgrade() {
        score++
    }
 }
 
 class User {
    var name: String
    var score: Int = 0
    init(name: String) {
        self.name = name
    }
    func upgrade() {
        score++
    }
 }
 
 var tom = User(name: "Tom")
 var tom2 = tom
 tom2.name = "tom2"
 tom.name // tom2
 
 var bob = UserStruct(name: "Bob")
 var bob2 = bob
 bob2.name = "bob2"
 bob.name
 
 */

/*
 extensionでデータ型機能拡張
 
 extension String {
    var size: Int {
        return countElements(self)
    }
    func dummy() -> String {
        return "dummy"
    }
 }
 
 var s: String = "hoge222"
 s.size // 7
 s.dummy() // dummy
 */

/*
 ジェネリクス
 
 func getIntArray(item: Int, count: Int) -> [Int] {
    var result = [Int]()
    for _ in 0..<count {
        result.append(item)
    }
    return result
 }
 
 getIntArray(8, 3)
 
 Intに限らずどんな型でも使えるようにできるのがジェネリクス！
 
 func getArray<T>(item: T, count: T) -> [T] {
    var result = [T]()
    for _ in 0..<count {
        result.append(item)
    }
    return result
}
 
 getArray(8,3)
 getArray("hello", 3) // ["hello","hello","hello"]
 
 */

var str = "Hello, playground"
print(str)
