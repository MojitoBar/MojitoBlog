---
date: 2022-02-20 21:39
description: Codable 이란?
tags: iOS, Swift
---

## Codable 이란?

<br/>
<img src="/images/codableImage.png"/>
<br/>

<blockquote><b class="inyong">자신을 외부 표현으로 또는 외부 표현으로 변환할 수 있는 형식입니다.</b></blockquote>

<br/>

### Apple Developer에서는 <b class="bold">Codable</b>을 위와 같이 설명한다.
### 여기서 외부 표현(External Representation)의 좋은 예로 <b class="heavy">JSON</b> 형태의 파일이 있을 수 있다.

```swift
 Codable = Decodable & Encodable
```
### 추가로 위와 같이 정의 되어있는데, <b class="heavy">Decodable</b>과 <b class="heavy">Encodable</b>은 각각 디코딩 할 수 있는 타입, 인코딩 할 수 있는 타입을 의미하는 프로토콜이다.
### 따라서 <b class="heavy">Codable</b>은 외부표현으로 디코딩하거나 인코딩할 수 있는 프로토콜이라는 뜻이다.

<br/>

### <b class="heavy">Codable</b>을 이용한 디코딩, 인코딩 예제를 살펴보자. 

## Encoding Example
```swift
import UIKit

// Codable 채택한 Struct
struct Car: Codable{
    var name: String
    var price: Int
}

// Json 인코더 선언
let encoder = JSONEncoder()

// 객체 생성
let Avante = Car(name: "Avante", price: 2000)

// Json 파일로 인코딩 후 확인을 위해 String으로 변환해서 출력
let jsonData = try? encoder.encode(Avante)
if let jsonData = jsonData, let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}
```

### 위 코드를 실행시 아래와 같은 결과가 잘 나오는 것을 확인할 수 있다.
### 주석을 확인해보면 어려운 코드가 아니라 쉽게 이해할 수 있다.

<br/>
```
{"name":"Avante","price":2000}
```

<br/>
## Decoding Example

```swift
// Json 디코더 선언
let decoder = JSONDecoder()

// Json 파일 디코딩 후 출력
if let jsonData = jsonData, let carData = try? decoder.decode(Car.self, from: jsonData) {
    print(carData.name)
    print(carData.price)
}
```

### <b class="heavy">jsonData</b>는 Encoding Example에서 사용된 것을 그대로 사용했다.
### <b class="bold">encode</b>, <b class="bold">decode</b> 모두 실패할 경우 에러를 발생시킬 수 있으므로 <b class="heavy">try</b>와 함께 써줘야한다.

<br/>
<br/>
## 참고자료
<ul>
<li>
    <a href="https://developer.apple.com/documentation/swift/codable">Apple Developer</a>
</li>
<li>
    <a href="https://zeddios.tistory.com/373">zeddios</a>
</li>
</ul>
