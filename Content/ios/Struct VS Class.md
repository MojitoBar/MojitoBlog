---
date: 2022-01-23 20:22
description: Struct와 Class의 차이점
tags: iOS, Swift
---

## Struct VS Class
### 이 포스팅에서는 <b class="heavy">Struct</b>가 무엇인지, <b class="heavy">Class</b>가 무엇인지 보단 해당 질문의 의도인 차이점에 포커스를 두고 정리해 보았다.
### 대표적인 차이점으로는 <b class="heavy">Struct</b>는 <b class="bold">값 타입</b>, <b class="heavy">Class</b>는 <b class="bold">참조 타입</b>이라는 것이다.

## Call By Value (값 타입)
### 값 타입은 데이터를 전달할 때 값을 복사하여 전달하며 원본은 그대로 유지된다.

```swift
struct Point {
    var x = 0.0
    var y = 0.0
}

let point_1 = Point.init()
var point_2 = point_1
point_2.x = 2

print(point_1.x,point_2.x)
```

### 위 코드의 결과는 <b class="bold">0.0 2.0</b> 이다.
### point_1와 point_2가 struct기 때문에 값이 복사만 되었기 때문이다.

## Call By Reference (참조 타입)
### 위 예제코드에서 <b class="heavy">Struct</b>를 <b class="heavy">Class</b>로 바꿔보자.
```
class Potin {
    var x = 0.0
    var y = 0.0
}

let point_1 = Point.init()
var point_2 = point_1
point_2.x = 2

print(point_1.x,point_2.x)
```

### 위 코드의 결과는 <b class="bold">2.0 2.0</b> 이다.
### point_1와 point_2가 <b class="heavy">Class</b>이기 때문에 어느 값을 수정하던 같은 메모리에 있는 원본을 수정하게 된다.

## 추가적인 차이점
### <b class="heavy">Class</b>는 다른 클래스의 단일 상속이 가능하지만 <b class="heavy">Struct</b>는 상속이 불가능하다.
### Class의 경우 참조하는 값이 존재하는 위치를 <b class="heavy">stack 메모리</b>, 참조되는 값은 <b class="heavy">heap 메모리</b>에 저장되지만 Struct는 <b class="heavy">stack 메모리</b>에 저장된다. 즉 Class를 사용하게 되면 Struct보다 더 많은 비용이 필요하기 때문에 Class의 특성이 필요하지 않으면 Struct를 사용하는 것이 좋다.

## 언제 사용해야 할까?
### 이는 Swift Language Guide에서 기준을 제시해주었다.
- 구조체의 주 목적이 관계된 간단한 값을 캡슐화(encapsulate) 하기 위한 것인 경우
- 구조체의 인스턴스가 참조되기 보다 복사되기를 기대하는 경우
- 구조체에 의해 저장된 어떠한 프로퍼티가 참조되기 보다 복사되기를 기대하는 경우
- 구조체가 프로퍼티나 메소드 등을 상속할 필요가 없는 경우

### 위와 같은 경우에는 Struct 사용을 고려해볼 필요가 있다는 것이다.
<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://zeddios.tistory.com/15?category=685736">Zeddios</a>
</li>
<li>
    <a href="https://sihyungyou.github.io/iOS-class-struct-enum/">sihyungyou's github.io</a>
</li>
</ul>
