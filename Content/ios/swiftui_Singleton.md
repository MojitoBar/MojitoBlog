---
date: 2021-02-28 19:29
description: SwiftUI Singleton
tags: SwiftUI
---
### SwiftUI Singleton
싱글톤 패턴이란 애플리케이션이 시작될 때 어떤 클래스가 최초 한번만 메모리를 할당하고 그 메모리에 인스턴스를 만들어 사용하는 디자인 패턴이다.

지금같은 경우는 로그인한 유저의 정보를 관리하기 위해 싱글톤 패턴을 사용했다.

### Singleton.swift
```Swift
class Singleton{
    static let sharedInstance = Singleton()
    
    var LoginUser = User(id: 0, nick: "", pw: "")
    var IsLogin: Bool = false
    
    init(){ }
    
    public func getUser() -> User{
        return LoginUser
    }
    
    public func setUser(id: String){
        LoginUser = User.init(id: 1, nick: id, pw: "1234")
    }
    
    public func getIsLogin() -> Bool{
        return IsLogin
    }
    
    public func setIsLogin(islogin: Bool){
        IsLogin = islogin
    }
}
```
`static let sharedInstance = Singleton()` 이 부분이 최초 1회 객체를 생성하는 부분이다.

User는 id, nick, pw 3가지 값을 가지고 있는 유저 구조체이고, IsLogin은 로그인 된 상태를 저장한다.
<br>
<br>
다른 곳에서 싱글톤 인스턴스를 쓰기 위해서는 `Singleton.sharedInstance.getUser()` 이런식으로 써주면 된다.

