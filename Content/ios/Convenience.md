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

### 반면에 Convenience init은 편의 초기화이다.
### 바로 예시 코드를 보며 특성을 알아보자.

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
    
    convenience init(name: String, age: Int) {
        self.init(name: name, age: age, gender: "male")
    }
}
```

### Convenience init은 보조 초기화라고도 불리는데, 말 그대로 원래 init을 보조해주는 역할을 한다.
### Designated init은 모든 프로퍼티가 초기화 되어야 하지만 Convenience init은 내부에 Designated init을 포함해야만 하기 때문에 프로퍼티의 일부만 받는 위와 같은 예제가 가능해진다.
 
<br/>

### 몰랐을 땐 대단한 기술인지 알았지만 알고보니 간단해 매우 유용하게 쓸 수 있을 것 같다.


<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://zeddios.tistory.com/141">ZeddiOS</a>
</li>
<li>
    <a href="https://ios-development.tistory.com/239">jake-kim's tistory</a>
</li>
</ul>
