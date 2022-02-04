---
date: 2022-02-04 23:49
description: Convenience init?
tags: iOS, Swift
---

## init과 Convenience init의 차이
### Swift에서 초기화는 2가지 종류가 있다.
### 지정 초기화인 init, (Designated init이라고도 한다.)와 Convenience init이다.
### init은 클래스의 모든 프로퍼티가 초기화 되어야 한다는 특성이 있다.

```swift
class Student {
    var name: String
    var age: Int
    var gender: String
    
    init(name: String, age: Int, gender: String) {
        self.name = name
        self.age = age
        self.gender = gender
    }
}
```

### 위 코드는 지정 초기화 예시이다.
### 만약 3개의 프로퍼티 중 하나라도 초기화에서 빠지면 오류가 난다.

<br/>
<br/>

### 

<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://developer.apple.com/documentation/foundation">Developer Apple</a>
</li>
</ul>
