---
date: 2021-02-28 19:29
description: Swift Tuple
tags: Swift
---

### Swift의 Tuple
먼저 Tuple은 Collection Type이 아니다. Collection Type에는 Array, Dictionary, Set만이 있다. 그래도 Type이긴 하다.

Tuple은 구조체와 비슷하다.
`var tuple = (1, "Hello, world!", true)`
이런식으로 여러가지 타입을 한꺼번에 묶어서 사용할 수 있다.

여기서 Tuple도 타입이기 때문에 Tuple안에 Tuple도 가능하다.

### Tuple 사용방법
실제로 다른 컬렉션 타입이나 구조체 때문에 Tuple을 쓸 일은 거의 없다. </br>
그래도 사용방법에 대해 알아보자.

```Swift
var tuple = (1, "Hello, world!", true)
tuple.0    // 1
tuple.1    // "Hello, world!"
```
이런식으로 인덱스만 찍어주면 바로 값에 접근이 가능하다.

또 다른 사용법으로 '이름'을 주는 방식이다.
`var namedTuple = (name: "Zedd", age: 999, likes : [Swift, iOS])`
##### 생긴게 딕셔너리와 비슷한듯..
이렇게 선언하면 인덱스 대신 이름을 찍어줄 수 있다.

```Swift
var namedTuple = (name: "Jito", age: 999, likes : [Swift, iOS])
namedTuple.name    // "Jito"
namedTuple.age     // 999
```

나름 쓸모 있어 보이는 튜플이지만 Swift 문서에 따르면, </br>

<b> Tuples are useful for temporary groups of related values. (…) If your data structure is likely to persist beyond a temporary scope, model it as a class or structure (…)</br>
튜플은 관련된 값들을 임시로 그룹지을때 유용합니다 (...) 만약 데이터구조가 임시범위를 넘어서 존속할 가능성이 있는 경우에는 클래스나 구조체로 모델링하십시오.</b>
라고 한다.
</br></br></br>
본 포스팅은 https://zeddios.tistory.com/238 [ZeddiOS] 를 참고했습니다.
